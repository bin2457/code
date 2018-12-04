package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDept;
import com.zs.pms.po.TUSer;
import com.zs.pms.vo.QueryUser;

public interface DepService {
public List<TDept>queryByPid(int pid);
}
