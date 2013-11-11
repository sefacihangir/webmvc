package org.yggd.webmvc;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/", "/top"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	/**
	 * return image
	 * @param model model
	 * @return imagedata
	 * @throws IOException ioexception
	 */
	@RequestMapping(value="/image", method = RequestMethod.GET,  produces = "image/jpeg")
	public @ResponseBody byte[] image(Model model) throws IOException {
		InputStream is = HomeController.class.getResourceAsStream("/org/yggd/webmvc/01.jpg");
		return IOUtils.toByteArray(is);
	}
	
	/**
	 * process JSON format request.
	 * 
	 * @param loginUser login user mapped from JSON
	 * @return JavaBean mapped to JSON format
	 */
	@RequestMapping(value="/postJson", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ValidUser postJson(@RequestBody LoginUser loginUser) {
		logger.info("Eメールアドレス:" + loginUser.getEmail());
		logger.info("ユーザID:" + loginUser.getUserId());
		logger.info("パスワード:" + loginUser.getPassword());
		
		ValidUser user = new ValidUser();
		if ("admin".equals(loginUser.getUserId()) && "adminpass".equals(loginUser.getPassword())) {
			user.setStatus(true);
			user.setName("名無しの権兵衛");
			return user;
		}
		user.setStatus(false);
		return user;
	}
}
