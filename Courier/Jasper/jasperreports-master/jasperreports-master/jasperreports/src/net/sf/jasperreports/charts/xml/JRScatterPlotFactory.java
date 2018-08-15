/*
 * JasperReports - Free Java Reporting Library.
 * Copyright (C) 2001 - 2018 TIBCO Software Inc. All rights reserved.
 * http://www.jaspersoft.com
 *
 * Unless you have purchased a commercial license agreement from Jaspersoft,
 * the following license terms apply:
 *
 * This program is part of JasperReports.
 *
 * JasperReports is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * JasperReports is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with JasperReports. If not, see <http://www.gnu.org/licenses/>.
 */
package net.sf.jasperreports.charts.xml;

import net.sf.jasperreports.charts.design.JRDesignScatterPlot;
import net.sf.jasperreports.engine.JRChart;
import net.sf.jasperreports.engine.xml.JRBaseFactory;

import org.xml.sax.Attributes;

/**
 * @author Teodor Danciu (teodord@users.sourceforge.net)
 */
public class JRScatterPlotFactory extends JRBaseFactory {
	private static final String ATTRIBUTE_isShowShapes = "isShowShapes";
	private static final String ATTRIBUTE_isShowLines = "isShowLines";
	
	@Override
	public Object createObject( Attributes attrs ){
		JRChart chart = (JRChart)digester.peek();
		JRDesignScatterPlot plot = (JRDesignScatterPlot)chart.getPlot();
		
		String isShowShapes = attrs.getValue( ATTRIBUTE_isShowShapes );
		if( isShowShapes != null && isShowShapes.length() > 0 ){
			plot.setShowShapes(Boolean.valueOf(isShowShapes) );
		}
		
		String isShowLines = attrs.getValue( ATTRIBUTE_isShowLines );
		if( isShowLines != null && isShowLines.length() > 0 ){
			plot.setShowLines(Boolean.valueOf(isShowLines) );
		}
		
		return plot;
	}
}
