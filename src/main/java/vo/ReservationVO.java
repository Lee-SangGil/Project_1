package vo;




	public class ReservationVO{
		
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getRunningTime() {
			return runningTime;
		}
		public void setRunningTime(String runningTime) {
			this.runningTime = runningTime;
		}

		public String getReserveDate() {
			return reserveDate;
		}
		public void setReserveDate(String reserveDate) {
			this.reserveDate = reserveDate;
		}
		public String getTicketNumber() {
			return ticketNumber;
		}
		public void setTicketNumber(String ticketNumber) {
			this.ticketNumber = ticketNumber;
		}
		public String getSelectedSeat() {
			return selectedSeat;
		}
		public void setSelectedSeat(String selectedSeat) {
			this.selectedSeat = selectedSeat;
		}
		public String getSelectedTheater() {
			return selectedTheater;
		}
		public void setSelectedTheater(String selectedTheater) {
			this.selectedTheater = selectedTheater;
		}

		public int getIdx() {
			return idx;
		}
		public void setIdx(int idx) {
			this.idx = idx;
		}
		private int idx;
		private String id;
		private String title;
		private String runningTime;	
		private String reserveDate;
		private String ticketNumber;
		private String selectedSeat;
		private String selectedTheater;
	
}
