package com.vendor.model;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class qrcode {

    public static void main(String[] args) {
        String data = "https://facebook.com"; // Replace with your data

        try {
            generateQRCode(data, "QRCode.png");
            System.out.println("QR Code generated successfully.");
        } catch (IOException | WriterException e) {
            e.printStackTrace();
        }
    }

    private static void generateQRCode(String data, String filePath) throws WriterException, IOException {
        int width = 300;
        int height = 300;

        BitMatrix bitMatrix = new MultiFormatWriter().encode(data, BarcodeFormat.QR_CODE, width, height);

        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = (Graphics2D) image.getGraphics();
        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, width, height);
        graphics.setColor(Color.BLACK);

        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                if (bitMatrix.get(i, j)) {  
                    graphics.fillRect(i, j, 1, 1);
                }
            }
        }

        ImageIO.write(image, "png", new File("Aman.png"));
      
    }
}
