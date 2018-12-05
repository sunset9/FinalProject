package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.TicketDao;
import ticket.dto.Hall;
import ticket.dto.Performance;
import ticket.dto.Seat;
import ticket.dto.User;
import ticket.service.face.TicketService;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	TicketDao ticketDao;
	
	@Override
	public void Ticketing(User user, Seat seat, Performance pfm) {
	
		ticketDao.insertTicket(user, seat, pfm);
	}

	@Override
	public List<Seat> LoadBookedSeats(Performance prm) {
		return ticketDao.selectBookedseats(prm);
	}

	@Override
	public void TempSeats(Seat seat, Performance pfm) {

		ticketDao.insertTempSeats(seat, pfm);
	}

	@Override
	public void LoadSeatsByHallIdx(Hall hall) {

		ticketDao.selectSeatsByHallIdx(hall);
	}

	@Override
	public void RemoveTempSeat(Seat seat) {
		// TODO Auto-generated method stub
		
	}

}
