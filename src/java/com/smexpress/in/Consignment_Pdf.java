/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.smexpress.in;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author Yogender
 */
public class Consignment_Pdf {

    public static void main(String arg[]) {
        String SourceFile = "D:\\Yogender\\NetBeansProjects\\TransporationManagement\\src\\java\\com\\smexpress\\in\\Consigner.jrxml";
        try {
            JasperReport jasperReport = JasperCompileManager.compileReport(SourceFile);

            Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
            JasperPrint print = JasperFillManager.fillReport(SourceFile, null, connection);
            OutputStream output = new FileOutputStream(new File("c:/catalog.pdf"));
            JasperExportManager.exportReportToPdfStream(print, output);
        } catch (FileNotFoundException | JRException e) {
            System.out.println(e.getMessage());
        }
    }
}
