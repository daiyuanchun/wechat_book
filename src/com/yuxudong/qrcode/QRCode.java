package com.yuxudong.qrcode;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import javax.imageio.ImageIO;
import com.swetake.util.Qrcode;

public class QRCode {
public static void main(String[] args) throws Exception{
	Qrcode x=new Qrcode();
	x.setQrcodeErrorCorrect('M');
	x.setQrcodeEncodeMode('B');
	x.setQrcodeVersion(7);
	String qrData="http://dai.tunnel.qydev.com/bookAllMessage.action?isbn=111111";
	int width=67+12*(7-1);
	int height=67+12*(7-1);
	BufferedImage bufferedImage=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	Graphics2D gs=bufferedImage.createGraphics();
	gs.setBackground(Color.WHITE);
	gs.setColor(Color.BLACK);
	gs.clearRect(0, 0, width, height);
	int pixoff=2;
	byte[] d=qrData.getBytes("gb2312");
	if(d.length>0&&d.length<120){
		boolean[][] s=x.calQrcode(d);
		for(int i=0;i<s.length;i++){
			for(int j=0;j<s.length;j++){
				if(s[j][i]){
					gs.fillRect(j*3+pixoff,i*3+pixoff,3,3);
				}
			}
		}
	}
	gs.dispose();
	bufferedImage.flush();
	ImageIO.write(bufferedImage, "png", new File("D:/Program Files/zxing/计算机网络.png"));
}
}
