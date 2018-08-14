/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.smexpress.in;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.lowagie.text.pdf.PdfTable;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

/**
 *
 * @author Yogender
 */
public class Consignment_Pdf {

    public static void main(String arg[]) {
        try {
            Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
            Statement statement = connection.createStatement();
            String sqlString = "SELECT * FROM employees";
            statement.executeQuery(sqlString);
            ResultSet rs = statement.getResultSet();
            ResultSetMetaData resultSetMetaData = rs.getMetaData();
            int colno = resultSetMetaData.getColumnCount();
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream("E:\\consignment.pdf"));
            PdfPTable pdfTable = new PdfPTable(colno);
            document.open();
            document.add(new Paragraph("CONSIGNMENT NOTE"));
            pdfTable.addCell(rs.getString(0));
            document.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
