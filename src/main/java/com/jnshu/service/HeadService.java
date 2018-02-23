package com.jnshu.service;

import com.jnshu.pojo.Head;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface HeadService {
    List<Head> getAll();
}
