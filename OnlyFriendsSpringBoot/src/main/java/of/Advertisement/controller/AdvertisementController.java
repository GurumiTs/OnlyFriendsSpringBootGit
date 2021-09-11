package of.Advertisement.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import of.Advertisement.model.Advertisement;
import of.Advertisement.model.AdvertisementService;

@Controller
public class AdvertisementController {

	@Autowired
	private AdvertisementService advertisementService;

	@GetMapping("/Advertisement.controller")
	public String processEntry(Model m) {
		List<Advertisement> advertisement = advertisementService.findAll();
		m.addAttribute("find", advertisement);
		return "advertisementpages/advertisementMgmt";
	}

	@GetMapping("/AdvertisementAll.controller")
	@ResponseBody
	public Map adDetail() {
		List<Advertisement> advertisement = advertisementService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("adAll", advertisement);
		return map;
	}
	
	@PostMapping("/showAd.controller")
	@ResponseBody
	public List<Advertisement> showAd() {
		List<Advertisement> advertisement = advertisementService.findAll();
		return advertisement;
	}
	
	@GetMapping("/adEntry.controller")
	public String adEntry() {
		
		return "advertisementpages/adview";
	}


	@PostMapping("/getPositionOneToJson.controller")
	@ResponseBody
	public List<Advertisement> showPositionOneToJson() {
		List<Advertisement> advertisement = advertisementService.findByadCondition("已上架1");
		return advertisement;
	}

	@PostMapping("/getPositionTwoToJson.controller")
	@ResponseBody
	public List<Advertisement> showPositionTwoToJson() {
		List<Advertisement> advertisement = advertisementService.findByadCondition("已上架2");
		return advertisement;
	}

	@PostMapping("/empinsertAdvertisement.controller")
	public String insertAdvertisement(@RequestParam("adImg") MultipartFile[] multipartFiles, HttpServletRequest request,
			@RequestParam String adCompanyName, @RequestParam String adCompanyPhone,
			@RequestParam String adCompanyEmail, @RequestParam String adName, @RequestParam String adStartDate,
			@RequestParam String adEndDate, @RequestParam String adCondition, Model m)
			throws IllegalStateException, IOException {
		System.out.println("1");
		String fileNames[] = new String[multipartFiles.length];
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile file = multipartFiles[i];

			String fileName = file.getOriginalFilename();

			fileNames[i] = "images/couponPic/" + fileName;
			String path = ResourceUtils.getURL("classpath:static/images/couponPic").getPath();
			String filePath = path + "/" + fileName;
			File saveFile = new File(filePath);
			file.transferTo(saveFile);
		}
		System.out.println(fileNames[0]);
		List<String> list = Arrays.asList(fileNames);
		System.out.println("2");
		
		Advertisement advertisement = new Advertisement();
		System.out.println("4");
		advertisement.setAdCompanyName(adCompanyName);
		advertisement.setAdCompanyPhone(adCompanyPhone);
		advertisement.setAdCompanyEmail(adCompanyEmail);
		advertisement.setAdName(adName);
		advertisement.setAdStartDate(adStartDate);
		advertisement.setAdEndDate(adEndDate);
		advertisement.setAdCondition(adCondition);
		advertisement.setAdImg(list.toString().replace("[", "").replace("]", "").trim());

		Advertisement a = advertisementService.findByadName(adName);

		if (a != null) {
			return "couponpages/couponsError";
		} else {
			advertisementService.insert(advertisement);
			m.addAttribute("find", advertisement);
			return "advertisementpages/advertisementMgmt";
		}
	}
	
	@GetMapping("/adDetailEntry.controller")
	public String adDetailEntry() {
		return "advertisementpages/adUpdate";
	}

	@PostMapping("/empupdateAdvertisement.controller")
	public String updateAdvertisement(@RequestParam("adImg") MultipartFile[] multipartFiles, HttpServletRequest request,
			@RequestParam Integer adId, @RequestParam String adCompanyName, @RequestParam String adCompanyPhone,
			@RequestParam String adCompanyEmail, @RequestParam String adName, @RequestParam String adStartDate,
			@RequestParam String adEndDate, @RequestParam String adCondition, Model m)
			throws IllegalStateException, IOException {

		String fileNames[] = new String[multipartFiles.length];
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile file = multipartFiles[i];

			String fileName = file.getOriginalFilename();

			fileNames[i] = "images/couponPic/" + fileName;
			String path = ResourceUtils.getURL("classpath:static/images/couponPic").getPath();
			String filePath = path + "/" + fileName;
			File saveFile = new File(filePath);
			file.transferTo(saveFile);
		}

		List<String> list = Arrays.asList(fileNames);
		

		Advertisement advertisement = new Advertisement();

		advertisement.setAdId(adId);
		advertisement.setAdCompanyName(adCompanyName);
		advertisement.setAdCompanyPhone(adCompanyPhone);
		advertisement.setAdCompanyEmail(adCompanyEmail);
		advertisement.setAdName(adName);
		advertisement.setAdStartDate(adStartDate);
		advertisement.setAdEndDate(adEndDate);
		advertisement.setAdCondition(adCondition);
		advertisement.setAdImg(list.toString().replace("[", "").replace("]", "").trim());

		Advertisement a = advertisementService.findByadId(adId);

		if (a != null) {
			advertisementService.update(advertisement);
			m.addAttribute("find", advertisement);
			return "advertisementpages/advertisementMgmt";
		} else {
			m.addAttribute("error", "Error");//在ˇ修改!!!!!!!!!!!!!!!
			return "advertisementpages/advertisementMgmt";
		}
	}

//	@PostMapping("/empdeleteAdvertisement.controller")
//	@ResponseBody
//	public String deleteAdvertisement(@RequestParam Integer adId) {
//       System.out.println(adId);
//       System.out.println("delet");
//		Advertisement c = advertisementService.findByadId(adId);
//
//		if (c != null) {
//			advertisementService.deleteByadId(adId);
//			return "success";
//		} else {
//			return "fail";
//		}
//	}
	@PostMapping("/empdeleteAdvertisement.controller")
	public String deleteAdvertisement(@RequestParam Integer adId) {
       System.out.println(adId);
		Advertisement c = advertisementService.findByadId(adId);

		if (c != null) {
			advertisementService.deleteByadId(adId);
			return "advertisementpages/advertisementMgmt";
		} else {
			
			return "advertisementpages/advertisementMgmt";
		}
	}
	
	@GetMapping("/Entry.controller")
	public String Entry() {
		
		return "advertisementpages/testInvoice";
	}
	

}
