package com.vendor.model;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class QRgenerator {

    public static void main(String[] args) {
        String data = "https://facebook.com"; // Replace with your data

        try {
            generateAndSaveQRCode(data, "Aman.png");
            System.out.println("QR Code generated and saved successfully.");
        } catch (IOException | WriterException | SQLException e) {
            e.printStackTrace();
        }
    }

    private static void generateAndSaveQRCode(String data, String filePath) throws WriterException, IOException, SQLException {
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

        ImageIO.write(image, "png", new File(filePath));

        // Convert QR code image to byte array
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ImageIO.write(image, "png", byteArrayOutputStream);
        byte[] imageBytes = byteArrayOutputStream.toByteArray();

        // Store the QR code in the database
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Shopping", "root", "Aman@8271")) {
            String sql = "INSERT INTO qr_codes (code_data) VALUES (?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setBytes(1, imageBytes);
                preparedStatement.executeUpdate();
            }
        }
    }
}
