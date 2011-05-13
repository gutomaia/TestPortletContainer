package net.guto.portlet.test.serveresource;

import java.io.IOException;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletContext;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.portlet.ResourceURL;

public class TestServeResourceBasic extends GenericPortlet {

	public static final String VIEW = "/WEB-INF/templates/portlet/serveresource/basic.jsp";
	public static final String RESOURCE_URL = "ajaxResource";

	@Override
	protected void doView(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		PortletContext context = getPortletContext();
		ResourceURL resourceURL = response.createResourceURL();

		request.setAttribute(RESOURCE_URL, resourceURL.toString());
		response.setContentType("text/html");

		PortletRequestDispatcher dispatcher = context
				.getRequestDispatcher(VIEW);
		dispatcher.include(request, response);
	}

	@Override
	public void serveResource(ResourceRequest request, ResourceResponse response)
			throws PortletException, IOException {
		response.setContentType("text/html");
		response.getWriter().append("OK");
	}
}
