package com.zj.dao;


import org.springframework.stereotype.Repository;

import com.zj.entity.Admin;




@Repository
public interface AdminMapper {
	
	public Admin getAdminByUsername(Admin admin);
	
}
