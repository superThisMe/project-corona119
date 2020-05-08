package com.project.corona.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.corona.service.NoticeService;
import com.project.corona.vo.NoticeVO;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

//		List<NoticeVO> notice = noticeService.findNoticeList();
//
//		model.addAttribute("notice", notice);

		return "index";
	}

	// �̹��� ÷�� �˾�
	@RequestMapping(value = "/daumOpenEditor/imagePopup")
	public String imagePopup() {
		return "/daumOpenEditor/image";
	}

	// ���� ���� ���ε� Ajax
	@RequestMapping(value = "/daumOpenEditor/singleUploadImageAjax", method = RequestMethod.POST)
	public @ResponseBody HashMap singleUploadImageAjax(@RequestParam("Filedata") MultipartFile multipartFile,
			HttpSession httpSession) {
		HashMap fileInfo = new HashMap(); // CallBack�� �� �̹��� ������ ���� Map
		// ���ε� ������ �����ϸ�
		if (multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {
			// Ȯ���� ����
			String originalName = multipartFile.getOriginalFilename(); // ���� ���ϸ�
			String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1).toLowerCase(); // ��������
																													// Ȯ����
																													// (�ҹ��ں���)
			if (!((originalNameExtension.equals("jpg")) || (originalNameExtension.equals("gif"))
					|| (originalNameExtension.equals("png")) || (originalNameExtension.equals("bmp")))) {
				fileInfo.put("result", -1); // ��� Ȯ���ڰ� �ƴ� ���
				return fileInfo;
			}
			// ����ũ������ (1MB)
			long filesize = multipartFile.getSize(); // ����ũ��
			long limitFileSize = 1 * 1024 * 1024; // 1MB
			if (limitFileSize < filesize) { // ���Ѻ��� ����ũ�Ⱑ Ŭ ���
				fileInfo.put("result", -2);
				return fileInfo;
			}
			// ������
			String defaultPath = httpSession.getServletContext().getRealPath("/"); // �����⺻��� (������Ʈ ���� �ƴ�)
			String path = defaultPath + File.separator + "upload" + File.separator + "board" + File.separator + "images"
					+ File.separator + "";
			// ������ ó��
			File file = new File(path);
			if (!file.exists()) { // ���丮 �������� ������� ���丮 ����
				file.mkdirs();
			}
			// ���� ����� ó�� (20150702091941-fd8-db619e6040d5.Ȯ����)
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new Date());
			String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
			// Multipart ó��
			try {
				// ������ ���� ���� (����)
				multipartFile.transferTo(new File(path + modifyName));
				// �α�
//				System.out.println("** upload ���� **");
//				System.out.println("** path : " + path + " **");
//				System.out.println("** originalName : " + originalName + " **");
//				System.out.println("** modifyName : " + modifyName + " **");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("�̹������Ͼ��ε� ���� - singleUploadImageAjax");
			}
			// CallBack - Map�� ���
			String imageurl = httpSession.getServletContext().getContextPath() + "/upload/board/images/" + modifyName; // separator�ʹ�
																														// �ٸ�!
			fileInfo.put("imageurl", imageurl); // ������ϰ��(�����ȯ�̳� ������ ����)
			//fileInfo.put("filename", modifyName); // ���ϸ�
			fileInfo.put("filename", originalName); // ���ϸ�
			fileInfo.put("filesize", filesize); // ���ϻ�����
			fileInfo.put("imagealign", "C"); // �̹�������(C:center)
			fileInfo.put("originalurl", imageurl); // �������ϰ��
			fileInfo.put("thumburl", imageurl); // ��������ϰ��(�����ȯ�̳� ������ ����)
			fileInfo.put("result", 1); // -1, -2�� ������ �ƹ��ų� �ƾ ��

		}
		
		return fileInfo; // @ResponseBody ������̼��� ����Ͽ� Map�� JSON���·� ��ȯ

	}

	// ���� ÷�� �˾�
	@RequestMapping(value = "/daumOpenEditor/filePopup")
	public String filePopup() {
		return "/daumOpenEditor/file";
	}
	
	// ���� ���� ���ε� Ajax
	@RequestMapping(value = "/daumOpenEditor/singleUploadFileAjax", method = RequestMethod.POST)
	public @ResponseBody HashMap singleUploadFileAjax(@RequestParam("Filedata") MultipartFile multipartFile, HttpSession httpSession) {

	    HashMap fileInfo = new HashMap(); // CallBack�� �� ���� ������ ���� Map

	    // ���ε� ������ �����ϸ�
	    if(multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {

	        // ����ũ������ (5MB)
	        long filesize = multipartFile.getSize(); // ����ũ��
	        long limitFileSize = 5*1024*1024; // 5MB
	        if(limitFileSize < filesize){ // ���Ѻ��� ����ũ�Ⱑ Ŭ ���
	            fileInfo.put("result", -1);
	            return fileInfo;
	        }

	        // ������
	        String defaultPath = httpSession.getServletContext().getRealPath("/"); // �����⺻��� (������Ʈ ���� �ƴ�)
	        String path = defaultPath + File.separator + "upload" + File.separator + "board" + File.separator + "files" + File.separator + "";

	        // ������ ó��
	        File file = new File(path);
	        if(!file.exists()) { // ���丮 �������� ������� ���丮 ����
	            file.mkdirs();
	        }

	        // ���� ����� ó�� (20150702091941-���ϸ�)
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String today= formatter.format(new Date());
	        String originalName = multipartFile.getOriginalFilename(); // �����̸�
	        String modifyName = today + "-" + originalName; 

	        // Multipart ó��
	        try {
	            // ������ ���� ���� (����)
	            multipartFile.transferTo(new File(path + modifyName));

	            // �α�
//	            System.out.println("** upload ���� **");
//	            System.out.println("** path : " + path + " **");
//	            System.out.println("** originalName : " + originalName + " **");
//	            System.out.println("** modifyName : " + modifyName + " **");
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("���Ͼ��ε� ���� - singleUploadFileAjax");
	        }

	        // mime
	        String fileMime = multipartFile.getContentType();

	        // CallBack - Map�� ���
	        String attachurl = httpSession.getServletContext().getContextPath() + "/upload/board/files/" + modifyName; // separator�ʹ� �ٸ�!
	        fileInfo.put("attachurl", attachurl); // ������ϰ��(�����ȯ�̳� ������ ����)
	        fileInfo.put("filemime", fileMime); // mime
	        //fileInfo.put("filename", modifyName); // ���ϸ�
	        fileInfo.put("filename", originalName); // ���ϸ�
	        fileInfo.put("filesize", filesize); // ���ϻ�����
	        fileInfo.put("result", 1); // -1�� ������ �ƹ��ų� �ƾ ��
	    }

	    return fileInfo;    // @ResponseBody ������̼��� ����Ͽ� Map�� JSON���·� ��ȯ
	}

}