package com.etms.core.util;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class SendMessage {
	
	/**
	 * 发送消息
	 * @param DestPort 
	 * @param DestIP
	 * @param data
	 * @throws Exception
	 */
   public static void sendMessage(int DestPort,String DestIP,String data) throws Exception{
	    final int DEST_PORT=DestPort;
		final String DEST_IP=DestIP;
		byte[] outBuff=new byte[4096];
		DatagramPacket outPacket=null;
		DatagramSocket sendSocket = null;
		try {
			System.out.println("发送的json数据为:" + data);
			sendSocket = new DatagramSocket();
			System.out.println("已创建sendSocket:" + sendSocket);
			outBuff = data.getBytes();
			outPacket = new DatagramPacket(outBuff, outBuff.length, InetAddress.getByName(DEST_IP), DEST_PORT);
			sendSocket.send(outPacket);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			if (sendSocket != null) {
				System.out.println("正在关闭sendSocket............");
				sendSocket.close();
				System.out.println("已关闭sendSocket");
			}
		}
   } 
}
