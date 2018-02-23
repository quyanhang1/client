package com.jnshu.service;

import com.jnshu.pojo.Study;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StudyService {
    List<Study> getAll();
}
