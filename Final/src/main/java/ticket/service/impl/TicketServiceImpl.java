package ticket.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.TicketDao;
import ticket.dto.Book;
import ticket.dto.Hall;
import ticket.dto.OriginSection;
import ticket.dto.Performance;
import ticket.dto.PfmDateByTime;
import ticket.dto.Seat;
import ticket.dto.SeatCurrent;
import ticket.dto.SeatSection;
import ticket.dto.SectionInfo;
import ticket.dto.Shipment;
import ticket.dto.User;
import ticket.dto.NumBookedSeat;
import ticket.service.face.TicketService;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	TicketDao ticketDao;

	@Override
	public List<PfmDateByTime> ticketDatePicker(Performance pfm) {
		return ticketDao.selectDates(pfm);
	}

	@Override
	public void ticketing(User user, Seat seat, Performance pfm) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Seat> loadBookedSeats(Performance prm, String secName, int dateByTimeIdx) {
		// TODO Auto-generated method stub
		return ticketDao.selectBookedseats(prm,secName, dateByTimeIdx);
	}

	@Override
	public void tempSeats(Seat seat, Performance pfm) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Seat> loadSeatsByHallIdx(Map sectionInfo) {
		return ticketDao.selectSeatsByHallIdx(sectionInfo);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeTempSeat(Seat seat) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PfmDateByTime> ticketTime(Performance pfm) {
		return ticketDao.selectDateTime(pfm);
	}

	@Override
	public List<OriginSection> loadOriginSection(Hall hall) {
		// TODO Auto-generated method stub
		return ticketDao.selectOriSecByHallIdx(hall);
	}

	@Override
	public List<SeatSection> loadSection(Performance pfm) {
		return ticketDao.selectSeatSectionByPfmIdx(pfm);
	}

	@Override
	public List<String> countSection(Performance pfm) {
		return ticketDao.selectCntSectionByPfmIdx(pfm);
	}

	@Override
	public int maxRow(int oriSecIdx) {
		return ticketDao.selectMaxRow(oriSecIdx);
	}

	@Override
	public int maxCol(int oriSecIdx) {
		return ticketDao.selectMaxCol(oriSecIdx);
	}

	@Override
	public List<SeatSection> loadPfmSection(Performance pfm) {
		// TODO Auto-generated method stub
		return ticketDao.selectSection(pfm);
	}

	@Override
	public int loadDayByTimeIdx(int pfmIdx, String date, String time) {
		
		
		return ticketDao.selectDayByTimeIdx(pfmIdx, date, time);
		
	}

	@Override
	public int loadOriginSecIdx(int hallIdx, String secName) {
		// TODO Auto-generated method stub
		return ticketDao.selectOriSecIdx(hallIdx,secName);
	}

	@Override
	public int loadSeatIdx(int hallIdx, int oriSecIdx, int seatRow, int seatCol) {
		// TODO Auto-generated method stub
		return ticketDao.selectSeatIdx(hallIdx, oriSecIdx, seatRow, seatCol);
	}

	@Override
	public void storedBook(Book book) {
		// TODO Auto-generated method stub
		ticketDao.insertBook(book);
	}

	@Override
	public void storedShipment(Shipment shipment) {
		
		ticketDao.insertShipment(shipment);
		
	}

	@Override
	public List<NumBookedSeat> countBookedSeats(Performance pfm, int bookCateIdx, int pfmDbtIdx) {
		return ticketDao.selectCntBookedSeats(pfm,bookCateIdx,pfmDbtIdx);
	}

	@Override
	public List<NumBookedSeat> countAllSeats(Performance pfm) {
		// TODO Auto-generated method stub
		return ticketDao.selectCntAllSeats(pfm);
	}

	@Override
	public List<SeatSection> loadSecPay(int pfmIdx) {
		return ticketDao.selectSecPayBypfmIdx(pfmIdx);
	}

	@Override
	public List<SectionInfo> loadsecInfo(int pfmIdx) {
		// TODO Auto-generated method stub
		return ticketDao.selectSecInfo(pfmIdx);
	}

	@Override
	public int countTemp(int pfmIdx, int seatIdx) {
		return ticketDao.selectCntTemp(pfmIdx, seatIdx);
	}

	@Override
	public void tempTicketing(SeatCurrent seatCurr) {
		
		ticketDao.insertTempSeats(seatCurr);
		
	}

	@Override
	public void deleteSeatCurr(SeatCurrent seatCurr) {
		
		ticketDao.DeleteTempSeat(seatCurr);
		
	}

	@Override
	public Performance loadPfmInfo(int pfmIdx) {
		// TODO Auto-generated method stub
		return ticketDao.selectPfmByPfmIdx(pfmIdx);
	}
	
	

}
