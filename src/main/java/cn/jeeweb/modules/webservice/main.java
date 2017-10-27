package cn.jeeweb.modules.webservice;

//import javax.xml.namespace.QName;
//
//import org.apache.axis2.AxisFault;
//import org.apache.axis2.addressing.EndpointReference;
//import org.apache.axis2.client.Options;
//import org.apache.axis2.rpc.client.RPCServiceClient;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;

import java.net.URL;

/**
 * Created by Chao.Cui.VWED on 2017/10/24.
 */
public class main {
    public static void main(String[] args) throws Exception {


        try {

            String service_url = "http://10.120.78.102:8031/GetProductInfo.svc?wsdl";
            String service_method = "GetProductInfoByProduceDate";
            Service service = new Service();
            String queryDate = "2017-08-17";
            Call call = null;
            try {
                call = (Call)service.createCall();
            } catch (ServiceException e) {
                e.printStackTrace();
            }
            call.setTargetEndpointAddress(new URL(service_url));
//        call.setUseSOAPAction(true);
            call.setOperationName(new QName("http://tempuri.org/", service_method));
            call.setSOAPActionURI("http://tempuri.org/IService1/GetProductInfoByProduceDate");
            call.addParameter(new QName("http://tempuri.org/", "date"), XMLType.XSD_STRING, javax.xml.rpc.ParameterMode.IN);
            call.setReturnType(XMLType.XSD_STRING);
            String xmlString = call. invoke(new Object[]{queryDate}).toString();

            JSONArray object = JSON.parseArray(xmlString.toString());
            System.out.println("xmlString:" + object.toJSONString() + " length:" + object.size());

        } catch (Exception e) {
            e.printStackTrace();
        }

//        //使用RPC方式调用WebService
//        RPCServiceClient serviceClient = new RPCServiceClient();
//        Options options = serviceClient.getOptions();
//        //指定调用WebService的URL
//        EndpointReference targetEPR = new EndpointReference(
//                "http://10.120.78.102:8031/GetProductInfo.svc?wsdl");
//        options.setTo(targetEPR);
//        options.setAction("http://tempuri.org/IService1/GetProductInfoByProduceDate");
//        //指定方法的参数值
//        Object[] opAddEntryArgs = new Object[] {};
//        //指定要调用的方法及WSDL文件的命名空间
//        QName opAddEntry = new QName("http://tempuri.org/", "GetProductInfoByProduceDate");
//
//
//        //调用法并输出该方法的返回值
//        System.out.println(serviceClient.invokeBlocking(opAddEntry, opAddEntryArgs));
//        /*Object[] result=serviceClient.invokeBlocking(opAddEntry, opAddEntryArgs, classes);
//        for (Object object : result) {
//            System.out.println(object.toString());
//        }*/
    }
}
