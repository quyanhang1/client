package com.jnshu.service;

import com.jnshu.pojo.Student;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StudentService {
    List<Student> getAll();
    int onStudy();
    int onWork();
}
