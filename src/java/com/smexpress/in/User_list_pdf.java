package com.smexpress.in;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Clock;
import java.time.Instant;
import javafx.scene.paint.Color;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author User
 */
public class User_list_pdf {

    public void user_list() {
        //private static final String XML_PATH = "/xml/20549776974-01-FFA1-80.XML";
        //private static final String JASPER_PATH = "/jasper/test-factura.jasper";
        try {
            Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
            Statement stmt = connection.createStatement();
            Statement statement = connection.createStatement();
            String sqlString = "SELECT * FROM employees ORDER BY employees_id";
            statement.executeQuery(sqlString);
            ResultSet rs = statement.getResultSet();

            Document doc = new Document();
            PdfPTable pdfPTable = new PdfPTable(7);
            FileOutputStream fileOutputStream = new FileOutputStream("E:\\employeee_list1" + (java.time.LocalDate.now()).toString() + ".pdf");
            PdfWriter.getInstance(doc, fileOutputStream);
            doc.open();
            doc.add(new Paragraph("Document Created On :" + java.time.LocalDate.now().toString() + "   " + java.time.LocalTime.now().toString()));

            PdfPCell pdfPCell = new PdfPCell(new Phrase("Hello PDF"));
            pdfPCell.setColspan(7);
            pdfPCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfPTable.addCell(pdfPCell);
            pdfPCell = new PdfPCell(new Phrase("EMPLOYEE ID"));
            pdfPTable.addCell(pdfPCell);
            pdfPCell = new PdfPCell(new Phrase("USER NAME"));
            pdfPTable.addCell(pdfPCell);
            pdfPCell = new PdfPCell(new Phrase("PASSWORD"));
            pdfPTable.addCell(pdfPCell);
            pdfPCell = new PdfPCell(new Phrase("ADDRESS"));
            pdfPTable.addCell(pdfPCell);
            pdfPCell = new PdfPCell(new Phrase("CITY"));
            pdfPTable.addCell(pdfPCell);
            pdfPCell = new PdfPCell(new Phrase("STATE"));
            pdfPTable.addCell(pdfPCell);
            pdfPCell = new PdfPCell(new Phrase("PIN"));
            pdfPTable.addCell(pdfPCell);

            while (rs.next()) {

                String employees_id = rs.getString("employees_id");
                pdfPCell = new PdfPCell(new Phrase(employees_id));
                pdfPTable.addCell(pdfPCell);

                String employees_name = rs.getString("employees_name");
                pdfPCell = new PdfPCell(new Phrase(employees_name));
                pdfPTable.addCell(pdfPCell);

                String employees_password = rs.getString("employees_password");
                pdfPCell = new PdfPCell(new Phrase(employees_password));
                pdfPTable.addCell(pdfPCell);

                String employees_address = rs.getString("employees_address");
                pdfPCell = new PdfPCell(new Phrase(employees_address));
                pdfPTable.addCell(pdfPCell);

                String employees_city = rs.getString("employees_city");
                pdfPCell = new PdfPCell(new Phrase(employees_city));
                pdfPTable.addCell(pdfPCell);

                String employees_state = rs.getString("employees_state");
                pdfPCell = new PdfPCell(new Phrase(employees_state));
                pdfPTable.addCell(pdfPCell);

                String employees_zip_code = rs.getString("employees_zip_code");
                pdfPCell = new PdfPCell(new Phrase(employees_zip_code));
                pdfPTable.addCell(pdfPCell);                
            }
            doc.add(pdfPTable);
            doc.close();
            fileOutputStream.close();
            connection.close();
        } catch (DocumentException | IOException | SQLException e) {
            //PdfPCell pdfPCell = new PdfPCell(new Phrase(e.getMessage()));            
        }
    }
}
