package mask.kakao;

import java.net.URI;
import java.net.URISyntaxException;
 
import mask.kakao.KakaoPayApprovalVO;
import mask.kakao.KakaoPayReadyVO;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.extern.java.Log;


	@Service
	@Log
	public class KakaoPay {
	 
	    private static final String HOST = "https://kapi.kakao.com";
	    
	    private KakaoPayReadyVO kakaoPayReadyVO;
	    
	    public String kakaoPayReady() {
	 
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "81c962d3bc816cae64c557e412d3a0eb");
	        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	        
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("partner_order_id", "1001");
	        params.add("partner_user_id", "gorany");
	        params.add("item_name", "이젠마스크");
	        params.add("quantity", "1");
	        params.add("total_amount", "2100");
	        params.add("tax_free_amount", "100");
	        params.add("approval_url", "http://localhost:9009/kakaoPaySuccess");
	        params.add("cancel_url", "http://localhost:9009/kakaoPayCancel");
	        params.add("fail_url", "http://localhost:9009/kakaoPaySuccessFail");
	 
	         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	 
	        try {
	            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
	            
	            System.out.println("" + kakaoPayReadyVO);
	            
	          //  return kakaoPayReadyVO.getNext_redirect_pc_url();
	 
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return "/pay";
	        
	    }
	    
	}
	 


