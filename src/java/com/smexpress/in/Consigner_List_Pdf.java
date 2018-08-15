/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.smexpress.in;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.ExporterInput;
import net.sf.jasperreports.export.OutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author Yogender
 */
public class Consigner_List_Pdf {

    public static void main(String[] args) throws FileNotFoundException, JRException {
        Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
        String report = "E:\\Yogender\\Courier\\NetBeansProjects\\TransporationManagement\\web\\report\\consigner_list.jrxml";
        JasperReport jasperReport = JasperCompileManager.compileReport(report);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);
        JasperViewer.viewReport(jasperPrint);
    }
    
    
    
    /*
    public void toPDF() {
        try {
            Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
            String report = "E:\\Yogender\\Courier\\NetBeansProjects\\TransporationManagement\\web\\report\\consigner_list.jrxml";
            JasperReport jasperReport = JasperCompileManager.compileReport(report);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);
            JasperViewer.viewReport(jasperPrint);
            System.out.print("Done!");
            File outDir = new File("E:\\jasperoutput");
            outDir.mkdirs();
            JRPdfExporter exporter = new JRPdfExporter();
            ExporterInput exporterInput = new SimpleExporterInput(jasperPrint);
            exporter.setExporterInput(exporterInput);
            OutputStreamExporterOutput exporterOutput = new SimpleOutputStreamExporterOutput("E:\\jasperoutput\\FirstJasperReport.pdf");
            exporter.setExporterOutput(exporterOutput);
            SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
            exporter.setConfiguration(configuration);
            exporter.exportReport();
            System.out.print("Done!");
        } catch (JRException ex) {
            System.out.println("Error : " + ex.getMessage());
        }
    }
    */
    /*
    public void toPDF3() {
        try {
            String reportSrcFile = "E:/Yogender/Courier/NetBeansProjects/TransporationManagement/web/report/consigner_list.jrxml";
            JasperReport jReport = JasperCompileManager.compileReport(reportSrcFile);
            Map<String, Object> parameters1 = new HashMap<String, Object>();
            print = JasperFillManager.fillReport(jReport, parameters1, connection);
            File outDir = new File("C:/jasperoutput");
            outDir.mkdirs();
            JRPdfExporter exporter = new JRPdfExporter();
            ExporterInput exporterInput = new SimpleExporterInput(print);
            exporter.setExporterInput(exporterInput);
            OutputStreamExporterOutput exporterOutput = new SimpleOutputStreamExporterOutput("e:/jasperoutput/FirstJasperReport.pdf");
            exporter.setExporterOutput(exporterOutput);
            SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
            exporter.setConfiguration(configuration);
            exporter.exportReport();
            System.out.print("Done!");
        } catch (JRException ex) {
            System.out.println("Error : " + ex.getMessage());
        }
    }
    
    
    public void toPDF2() {
        try {
            JasperReport jasperReport = null;
            InputStream path = this.getClass().getResourceAsStream("consigner_list.jrxml");
            System.out.println(path);
            JasperPrint jasperPrint = null;
            jasperReport = JasperCompileManager.compileReport(path);
            HashMap parameters = new HashMap();
            jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
            JasperViewer.viewReport(jasperPrint, true);
        } catch (JRException ex) {
            System.out.println("Error : " + ex.getMessage());
        }
    }
     */
}
