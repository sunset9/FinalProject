package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PfmDetailDao;
import ticket.dto.ExpectRecomm;
import ticket.dto.Expectation;
import ticket.dto.Performance;
import ticket.dto.PfmDetail;
import ticket.dto.Poster;
import ticket.dto.Review;
import ticket.dto.ReviewRecomm;
import ticket.service.face.PfmDetailService;

@Service
public class PfmDetailServiceImpl implements PfmDetailService {
	
	@Autowired PfmDetailDao mDetailDao;

	@Override
	public Poster getChoicePfmDetail(Performance pfm) {
		return mDetailDao.selectChoiceDetail(pfm);
	}

	@Override
	public List getExpectationList(Performance pfm) {
		return mDetailDao.selectExpectationList(pfm);
	}

	@Override
	public void getInExpectation(Expectation exp) {
		mDetailDao.insertExpectation(exp);
	}

	@Override
	public boolean getDelExpectation(Expectation exp) {
		return mDetailDao.deleteExpectation(exp);
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
	
}
