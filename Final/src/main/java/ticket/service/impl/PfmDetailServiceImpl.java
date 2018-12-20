package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PfmDetailDao;
import ticket.dto.Artist;
import ticket.dto.ExpectRecomm;
import ticket.dto.Expectation;
import ticket.dto.Performance;
import ticket.dto.PfmDetail;
import ticket.dto.Poster;
import ticket.dto.Review;
import ticket.dto.ReviewRecomm;
import ticket.dto.User;
import ticket.service.face.PfmDetailService;

@Service
public class PfmDetailServiceImpl implements PfmDetailService {
	
	@Autowired PfmDetailDao mDetailDao;

	@Override
	public Poster getChoicePfmDetail(Performance pfm) {
		return mDetailDao.selectChoiceDetail(pfm);
	}

	@Override
	public List<Expectation> getExpectationList(Performance pfm) {
		return mDetailDao.selectExpectationList(pfm);
	}

	@Override
	public void getExpectationInsert(String expContent, String pfmIdx, String userIdx) {
		mDetailDao.insertExpectation(expContent, pfmIdx, userIdx);
	}

	@Override
	public boolean getDelExpectation(String expIdx) {
		return mDetailDao.deleteExpectation(expIdx);
	}

	@Override
	public void getInExpRecomm(ExpectRecomm expRecomm) {
		mDetailDao.insertExpRecomm(expRecomm);
	}

	@Override
	public boolean getDelExpRecomm(ExpectRecomm expRecomm) {
		return mDetailDao.deleteExpRecomm(expRecomm);
	}

	@Override
	public List getReviewList(Performance pfm) {
		return mDetailDao.selectReviewList(pfm);
	}

	@Override
	public void getInReview(Review review) {
		mDetailDao.insertReview(review);
	}

	@Override
	public boolean getDelReview(Review review) {
		return mDetailDao.deleteReview(review);
	}

	@Override
	public void getInReviewRecomm(ReviewRecomm reRecomm) {
		mDetailDao.insertReviewRecomm(reRecomm);
	}

	@Override
	public boolean getDelReviewRecomm(ReviewRecomm reRecomm) {
		return mDetailDao.deleteReviewRecomm(reRecomm);
	}

	@Override
	public Performance getPfmInfo(Performance pfm) {
		return mDetailDao.selectPfmInfo(pfm);
	}

	@Override
	public PfmDetail pfmDetailInfo(Performance pfm) {
		return mDetailDao.selectPfmDetailInfo(pfm);
	}

	@Override
	public List<Artist> getCastInfo(Performance pfm) {
		return mDetailDao.selectCastInfo(pfm);
	}

	@Override
	public List<User> getExpectationUserList(Performance pfm) {
		return mDetailDao.selectExpecUserList(pfm);
	}
	
}
