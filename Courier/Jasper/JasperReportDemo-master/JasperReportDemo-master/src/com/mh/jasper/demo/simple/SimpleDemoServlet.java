package com.mh.jasper.demo.simple;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mh.jasper.demo.bean.User;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

public class SimpleDemoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String contextPath = req.getRealPath("");
		System.out.println(contextPath);
		String jasperTemplatePath = contextPath + "/jasper/simpleDemo.jrxml";
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(prepareData());
		try {
			JasperReport jreport = JasperCompileManager.compileReport(jasperTemplatePath);
			byte[] bytes = JasperRunManager.runReportToPdf(jreport, new HashMap(), dataSource);
			resp.setContentType("application/pdf");
			resp.setCharacterEncoding("UTF-8");
			resp.setHeader("Content-Disposition", "inline; filename=\""+ URLEncoder.encode("simpleDemo", "UTF-8") + ".pdf\"");
			resp.setContentLength(bytes.length);
			ServletOutputStream ouputStream = resp.getOutputStream();
			ouputStream.write(bytes, 0, bytes.length);
			ouputStream.flush();
			ouputStream.close();
		} catch (JRException e) {
			e.printStackTrace();
		}
	}
	
	private List<User> prepareData() {
		List<User> lsUser = new ArrayList<User>();
		User user1 = new User();
		User user2 = new User();
		User user3 = new User();
		
		user1.setUsername("jasonyao");
		user1.setPassword("jasonyao");
		user1.setAge(27);
		
		user2.setUsername("carter");
		user2.setPassword("carter");
		user2.setAge(36);
		
		user3.setUsername("salk");
		user3.setPassword("salk");
		user3.setAge(26);
		
		lsUser.add(user1);
		lsUser.add(user2);
		lsUser.add(user3);
		
		return lsUser;
	}

}
