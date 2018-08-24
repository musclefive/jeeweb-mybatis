package cn.jeeweb.modules.test.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

/**
 * Created by Chao.Cui.VWED on 2018/4/2.
 */
public class SocketTest {
    public static void main(String [] args) throws IOException{
        System.out.println("CC");
        Socket s = new Socket("172.16.33.52",49361);
        InputStream in = s.getInputStream();

        char c = (char) in.read();
        System.out.println(c);
        in.close();
        s.close();

    }
}
