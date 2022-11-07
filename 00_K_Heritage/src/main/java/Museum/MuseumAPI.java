package Museum;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class MuseumAPI {
	
	public static void main(String[] args) {
		
		List<Museum> mlist = callMuseumByXML();
		
		for(Museum m : mlist) {
			System.out.println(m.toString());
		}
		System.out.println(mlist.size());
	}
	
	//http://api.data.go.kr/openapi/tn_pubr_public_museum_artgr_info_api?serviceKey=XLl3OZaBCSpLl%2BYFTAbqfmwWNVnKx4KIZzzA8CnzEpM5XO8eikZQJ6%2BdJztkLRCxzv6IKYByw9a6BJmk0d0Yww%3D%3D&pageNo=1&numOfRows=100&type=xml
	public static final String CONVENIENT_XML_URL = "http://api.data.go.kr/openapi/tn_pubr_public_museum_artgr_info_api";
	public static int pageNo = 1;
	public static int numOfRows = 100;

	public static List<Museum> callMuseumByXML() {

		List<Museum> mlist = new ArrayList<Museum>();
		
		while (true) {
			StringBuilder urlBuffer = new StringBuilder(CONVENIENT_XML_URL);
			urlBuffer.append("?" + "serviceKey="
					+ "XLl3OZaBCSpLl%2BYFTAbqfmwWNVnKx4KIZzzA8CnzEpM5XO8eikZQJ6%2BdJztkLRCxzv6IKYByw9a6BJmk0d0Yww%3D%3D");
			urlBuffer.append("&" + "pageNo=" + pageNo);
			urlBuffer.append("&" + "numOfRows=" + numOfRows);
			urlBuffer.append("&" + "type=" + "xml");

//			System.out.println(urlBuffer);

			try {
				URL url = new URL(urlBuffer.toString());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Accept", "application/xml");
				int code = conn.getResponseCode(); // 실제호출하는부

//				System.out.println("Response code: " + code);

				if (code < 200 || code > 300) {
					System.out.println("페이지가 잘못되었습니다.");
				}

				// 3. 페이지 Parsing(해석)
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();

				Document doc = db.parse(conn.getInputStream()); // xml 부를 파싱하여 객체화

				doc.getDocumentElement().normalize();

//				System.out.println("Root Element : " + doc.getDocumentElement().getNodeName());
//				System.out.println("======================================================");

				NodeList nList = doc.getElementsByTagName("item");

				if (nList.getLength() <= 0) {
					return mlist;
				}

				for (int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);
//							System.out.println("\nCurrent Element : " + node.getNodeName());
					if (node.getNodeType() == Node.ELEMENT_NODE) {
						try {
							Element eElement = (Element) node;

							String fcltyNm = getStrData(eElement, "fcltyNm");
							String areadr = getAreaData(eElement, "rdnmadr");
							String rdnmadr = getStrData(eElement, "rdnmadr");
							String latitude = getStrData(eElement, "latitude");
							String longitude = getStrData(eElement, "longitude");
							String operPhoneNumber = getStrData(eElement, "operPhoneNumber");
							String operInstitutionNm = getStrData(eElement, "operInstitutionNm");
							String homepageUrl = getStrData(eElement, "homepageUrl");
							String fcltyInfo = getStrData(eElement, "fcltyInfo");
							String weekdayOperOpenHhmm = getStrData(eElement, "weekdayOperOpenHhmm");
							String weekdayOperColseHhmm = getStrData(eElement, "weekdayOperColseHhmm");
							String holidayOperOpenHhmm = getStrData(eElement, "holidayOperOpenHhmm");
							String holidayCloseOpenHhmm = getStrData(eElement, "holidayCloseOpenHhmm");
							String rstdeInfo = getStrData(eElement, "rstdeInfo");
							String adultChrge = getStrData(eElement, "adultChrge");
							String yngbgsChrge = getStrData(eElement, "yngbgsChrge");
							String childChrge = getStrData(eElement, "childChrge");
							String etcChrgeInfo = getStrData(eElement, "etcChrgeInfo");
							String fcltyIntrcn = getStrData(eElement, "fcltyIntrcn");
							String trnsportInfo = getStrData(eElement, "trnsportInfo");
							String phoneNumber = getStrData(eElement, "phoneNumber");
							String institutionNm = getStrData(eElement, "institutionNm");
							int cnt = 0;
									
							Museum m = new Museum(0, fcltyNm, areadr, rdnmadr, 
									latitude, longitude, operPhoneNumber, 
									operInstitutionNm, homepageUrl, fcltyInfo, weekdayOperOpenHhmm, 
									weekdayOperColseHhmm, holidayOperOpenHhmm, holidayCloseOpenHhmm, 
									rstdeInfo, adultChrge, yngbgsChrge, childChrge, 
									etcChrgeInfo, fcltyIntrcn, trnsportInfo, phoneNumber, institutionNm, cnt);
							
							mlist.add(m);
						} catch (Exception e) {
							System.out.println("데이터가 잘못되었습니다.");
						}
					}
				}
				System.out.println("페이지 : " + pageNo++);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private static String getStrData(Element eElement, String tagName) {
		try {
			return eElement.getElementsByTagName(tagName).item(0).getTextContent();
		} catch (Exception e) {
			return "-";
		}
	}
	
	private static String getAreaData(Element eElement, String tagName) {
		
		try {
			int idx = 0;
			
			if(idx == 0) {
				idx = eElement.getElementsByTagName(tagName).item(0).getTextContent().trim().substring(0, 7).indexOf("도") + 1;
			}
			if(idx == 0) {
				idx = eElement.getElementsByTagName(tagName).item(0).getTextContent().trim().substring(0, 7).indexOf("시") + 1;
//				idx = eElement.getElementsByTagName(tagName).item(0).getTextContent().trim().indexOf("시") + 1;
			}
			

			String area = eElement.getElementsByTagName(tagName).item(0).getTextContent().trim().substring(0, idx);
				
			switch (area) {
			case "경기도": case "서울특별시": case "인천광역시": case "서울특별시 도":
				area = "수도권";
				break;
			case "충청북도": case "충청남도": case "세종특별자치시": case "대전광역시":
				area = "충청권";
				break;
			case "강원도": 
				area = "강원권";
				break;
			case "광주광역시": case "전라북도": case "전라남도":
				area = "전라권";
				break;
			case "울산광역시": case "부산광역시": case "경상남도": case "경상북도": case "대구광역시": 
				area = "경상권";
				break;
			case "제주특별자치도": 
				area = "제주권";
				break;
			}
			return area;
		} catch (Exception e) {
			return "-";
		}
	}
}