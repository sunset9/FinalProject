package ticket.dao.face;

import java.util.List;

import ticket.dto.Poster;

public interface PosterDao {

	public void insert(Poster info);

	public List<Poster>selectBygenreIdx(int genreIdx);
	
	public List<Poster>selectBypfmIdx();
}
