package com.jnshu.service;

import com.jnshu.pojo.Profession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProfessionService  {
    List<Profession> getFont();
    List<Profession> getBack();
    List<Profession> getMobile();
}
