package com.mh.jasper.demo.simple;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import com.mh.jasper.demo.bean.User;
import com.mh.jasper.demo.bean.UserRole;

public class SubReportDemoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String contextPath = req.getRealPath("");
		String jasperTemplatePath = contextPath + "/jasper/subReportDemo.jrxml";
		String subReportTemplatepPath = contextPath + "/jasper/subReportDemo_subreport1.jrxml";
		JRDataSource dataSource = new JRBeanCollectionDataSource(prepareData());
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("SUBREPORT_DIR", contextPath + "/jasper/");
		try {
			JasperReport jreport = JasperCompileManager.compileReport(jasperTemplatePath);
			JasperCompileManager.compileReportToFile(subReportTemplatepPath, subReportTemplatepPath.replaceAll("jrxml", "jasper"));
			byte[] bytes = JasperRunManager.runReportToPdf(jreport, parameters, dataSource);
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
		
		user1.setUsername("jasonyao");
		user1.setPassword("jasonyao");
		user1.setAge(27);
		
		List<UserRole> roleList = new ArrayList<UserRole>();
		UserRole role1 = new UserRole();
		role1.setRoleId("1");
		role1.setRoleName("makder");
		
		UserRole role2 = new UserRole();
		role2.setRoleId("2");
		role2.setRoleName("checker");
		
		roleList.add(role1);
		roleList.add(role2);
		
		user1.setRoleList(roleList);
		lsUser.add(user1);
		return lsUser;
	}

}
