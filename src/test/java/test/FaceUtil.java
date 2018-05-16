package test;
/**
 * face++响应报文解析类
 */
public class FaceUtil {

	private String image_id;
	private String request_id;
	private IdCard[] cards;
	private Legality legality;

	static class IdCard {
		private String name;
		private String gender;
		private String id_card_number;
		private String birthday;
		private String race;
		private String address;
		private String type;
		private String side;
        private Legality legality;
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getId_card_number() {
			return id_card_number;
		}

		public void setId_card_number(String id_card_number) {
			this.id_card_number = id_card_number;
		}

		public String getBirthday() {
			return birthday;
		}

		public void setBirthday(String birthday) {
			this.birthday = birthday;
		}

		public String getRace() {
			return race;
		}

		public void setRace(String race) {
			this.race = race;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public String getSide() {
			return side;
		}

		public void setSide(String side) {
			this.side = side;
		}

		public Legality getLegality() {
			return legality;
		}

		public void setLegality(Legality legality) {
			this.legality = legality;
		}

	}

	static class Legality {
		private String Edited;
		private String Photocopy;
		private String Screen;

		public String getEdited() {
			return Edited;
		}

		public void setEdited(String edited) {
			Edited = edited;
		}

		public String getPhotocopy() {
			return Photocopy;
		}

		public void setPhotocopy(String photocopy) {
			Photocopy = photocopy;
		}

		public String getScreen() {
			return Screen;
		}

		public void setScreen(String screen) {
			Screen = screen;
		}

	}

	public String getImage_id() {
		return image_id;
	}

	public void setImage_id(String image_id) {
		this.image_id = image_id;
	}

	public String getRequest_id() {
		return request_id;
	}

	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}

	public IdCard[] getCards() {
		return cards;
	}

	public void setCards(IdCard[] cards) {
		this.cards = cards;
	}

	public Legality getLegality() {
		return legality;
	}

	public void setLegality(Legality legality) {
		this.legality = legality;
	}

}
