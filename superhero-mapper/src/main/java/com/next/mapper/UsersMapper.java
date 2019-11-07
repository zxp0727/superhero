package com.next.mapper;

import com.next.my.mapper.MyMapper;
import com.next.pojo.Users;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersMapper extends MyMapper<Users> {
}