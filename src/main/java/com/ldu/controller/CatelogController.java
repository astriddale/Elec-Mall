package com.ldu.controller;

import org.springframework.stereotype.Controller;

import com.ldu.service.CatelogService;

import javax.annotation.Resource;

/**
 * Created by swx on 2021/03/21.
 */
@Controller
public class CatelogController {
    @Resource
    private CatelogService catelogService;

}
