package mask.kakao;

import org.springframework.stereotype.Controller;
import mask.kakao.KakaoPay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class kakaoController {
	

    @Setter
    private KakaoPay kakaopay;
    
    
    @RequestMapping("/kakaoPay.mk")
    public void kakaoPayGet() {
        
    }
    
    @RequestMapping("/kakaoPay.mk")
    public String kakaoPay() {
        System.out.println("kakaoPay post............................................");
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
    @RequestMapping("/kakaoPaySuccess.mk")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
    	ModelAndView mv = new ModelAndView("/shop/kakaPay");
    	 System.out.println("kakaoPaySuccess get............................................");
    	 System.out.println("kakaoPaySuccess pg_token : " + pg_token);
        
    }

}
