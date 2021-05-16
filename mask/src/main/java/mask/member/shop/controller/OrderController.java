package mask.member.shop.controller;

import java.io.BufferedReader;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mask.common.CommandMap;
import mask.member.shop.service.OrderService;

@Controller
public class OrderController {

	@Resource(name="orderService")
	private OrderService orderService;

	@RequestMapping(value = "/shop/goodsOrder.mk", method = RequestMethod.GET)
	   public ModelAndView goodsOrder(CommandMap commandMap, HttpServletRequest request) throws Exception { // 상품디테일에서 구매 
	      ModelAndView mv = new ModelAndView("/goodsOrder");
	      Object MEM_NUM = ""; //세션값 가져오기 
	      HttpSession session = request.getSession(); 
	      commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
	      return mv;
	   }
	
	
	
	@RequestMapping(value="/order/orderPay.mk")
	public ModelAndView orderPay(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("member/orderCom");
		System.out.println("들어옴");
	    //Object MEM_NUM = ""; //세션값 가져오기 
		HttpSession session = request.getSession(); 
		commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
		Map<String,Object> map = orderService.selectOrder(commandMap, request);
		
		mv.addObject("map", map);
		return mv;
		}
	
	
	@RequestMapping("/kakaopay.mk")
	@ResponseBody
	public String kakaopay() { 
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection scon = (HttpURLConnection) address.openConnection();
			scon.setRequestMethod("POST");   //내가 발급받은 어드민 키
			scon.setRequestProperty("Authorization", "KakaoAK 81c962d3bc816cae64c557e412d3a0eb");
			scon.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			scon.setDoOutput(true); //커넥션에 doinput과 dooutp // 내보낼것이 있다! 
			String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=이젠마스크&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:9009/mask/&fail_url=http://localhost:9009/mask/&cancel_url=http://localhost:9009/mask/";
			OutputStream oss = scon.getOutputStream();
			DataOutputStream datao = new DataOutputStream(oss);
			datao.writeBytes(parameter);
			datao.flush(); //가지고 있는 어떤것을 비운다 - 전깃줄에 태워보단다
			datao.close(); //닫는다 그만쓸것
			
			int resu = scon.getResponseCode();//결과를 int로 받음
			InputStream ins;
			if(resu == 200) //결과가 200이면 정상적인 코드를 나타내는 숫자가 200
			{ 
				ins = scon.getInputStream();
			}else{ 
				ins = scon.getErrorStream();
			}
			InputStreamReader rea = new InputStreamReader(ins);
			
			BufferedReader brd = new BufferedReader(rea);
			
			return brd.readLine();
			//주는 애 전깃줄로부터
			//서버연결                    //강제형변
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return("");
	}
	

	
	
	
	
}
