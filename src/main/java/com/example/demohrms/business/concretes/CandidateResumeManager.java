package com.example.demohrms.business.concretes;

import com.example.demohrms.business.abstracts.CandidateResumeService;
import com.example.demohrms.core.business.SingleModelMapper;
import com.example.demohrms.core.results.DataResult;
import com.example.demohrms.core.results.SuccessDataResult;
import com.example.demohrms.dataAccess.CandidateDao;
import com.example.demohrms.dataAccess.CandidateEducationDao;
import com.example.demohrms.entities.dtos.CandidateResumeShowDto;
import com.example.demohrms.entities.dtos.CandidateShowDto;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CandidateResumeManager implements CandidateResumeService {
    private CandidateDao candidateDao;
    private CandidateEducationDao candidateEducationDao;
    private ModelMapper modelMapper;

    @Autowired
    public CandidateResumeManager(
            CandidateDao candidateDao,
            CandidateEducationDao candidateEducationDao,
            ModelMapper modelMapper
    ){
        this.candidateDao=candidateDao;
        this.candidateEducationDao=candidateEducationDao;
        this.modelMapper=modelMapper;
    }

    @Override
    public DataResult<CandidateResumeShowDto> getResumeByCandidateId(int candidateId) {

        CandidateResumeShowDto candidateResume = new CandidateResumeShowDto();

        CandidateShowDto candidateShowDto = modelMapper.map(this.candidateDao.findById(candidateId).get(),CandidateShowDto.class);
        candidateResume.setCandidateShowDto(candidateShowDto);

        candidateResume.setCandidateEducations(this.candidateEducationDao.findAllByCandidateId(candidateId));
        return new SuccessDataResult<>(candidateResume);
    }
}
