package ticket.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import ticket.dto.NoticeFile;


public class DownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		NoticeFile file = (NoticeFile) model.get("downFile"); 
		
		// 이진데이터를 출력하는 MIME-TYPE 설정
		response.setContentType("application/octet-stream"); // 응답을 파일로 생성
		
		// 서블릿컨텍스트 얻기
		ServletContext context = request.getSession().getServletContext();
		
		
		
		// 업로드된 파일 객체 얻기
		File src = new File(context.getRealPath("upload")	// 경로
				, file.getStoredName());		// 저장된 이름

//		System.out.println(src.exists()); // 존재 여부
		
		// 파일크기 설정(어디까지 다운받아야하는지 알림)
		response.setContentLength( (int) src.length() );
		
		// 인코딩 설정
		response.setCharacterEncoding("utf-8");
		
		// 파일이름 인코딩 설정
		String filename = URLEncoder.encode(file.getOriginName(), "utf-8");
		
		System.out.println(filename);
		
		// UTF-8 인코딩 오류 수정
		filename = filename.replace("+", "%20"); //   ' '(띄어쓰기) -> %20(아스키코드) , +(utf-8)
		
		filename = filename.replace("%5B", "[");
		filename = filename.replace("%5D", "]");
		
		
		
		
//		/file/download?fileno=3 (list에 fileno 클릭)
//		System.out.println("DownloadView Model"); // 테스트
//		System.out.println(file); // 테스트
		
		
		// 다운로드 되는 파일의 이름 설정하기
		response.setHeader(
				"content-Disposition", 
				"attachment; filename=\""
				+filename +"\""); 
		
		// 서버의 File -> FileInputStream으로 읽기 -> Response의 OutputStream으로 출력
		
		// 서버에 저장된 파일 객체
		File origin = new File( context.getRealPath("upload"),
				file.getStoredName());
		
		// 서버의 파일입력 스트림
		FileInputStream fis = new FileInputStream(origin);
		
		// 서버의 응답 출력스트림
		OutputStream out = response.getOutputStream();

		// 서버 -> 클라이언트 복사
		FileCopyUtils.copy(fis, out);
		
		// 출력스트림 버퍼 비우기
		out.flush();
		
		// 스트림 닫기
		fis.close();
		out.close();
		
	}
}
