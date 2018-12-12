package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.TicketDao;
import ticket.dto.Hall;
import ticket.dto.OriginSection;
import ticket.dto.Performance;
import ticket.dto.PfmDateByTime;
import ticket.dto.Seat;
import ticket.dto.SeatSection;
import ticket.dto.User;
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
	public List<Seat> loadBookedSeats(Performance prm) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void tempSeats(Seat seat, Performance pfm) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void loadSeatsByHallIdx(Hall hall) {
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
	
	

}
