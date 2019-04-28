package com.etms.user.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import com.etms.core.mapper.JedisClient;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.core.util.VerificationCodeUtils;
import com.etms.user.pojo.User;
import com.etms.user.service.UserService;
	
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
	@Autowired
	private JedisClient jedisClient;
	
	@Override
	public User login(User user) {
		String pass = DigestUtils.md5DigestAsHex(user.getUserPsw().getBytes());
		user.setUserPsw(pass);
		user.setFlag(1);
		return userMapper.login(user);
	}
	
	@Override
	public int findUserName(String userName) {
		return userMapper.findUserName(userName);
	}
	
	@Override
	public String getStatusCode(String userName) {
		String sendCode = VerificationCodeUtils.sendCode(userName);
		if(null != sendCode){
			if(sendCode.substring(4).equals("00000")){
				jedisClient.set(userName+":code", sendCode.substring(0, 4));
				jedisClient.expire(userName+":code", 300);
			}
			return sendCode.substring(4);			
		}
		return null;
	}
	
	@Override
	public int register(String userName, String userPsw, String code) {
		String phoneCode = jedisClient.get(userName+":code");
		if(!(phoneCode.equals(code))){
			//验证码不正确，注册失败
			return 0;
		}else{
			String pass = userMapper.selectUserPswByUserName(userName);
			if(pass != null){
				//说明该手机号已注册
				return 2;
			}else{
				//允许注册
				//对密码进行md5编码
				String psw = DigestUtils.md5DigestAsHex(userPsw.getBytes());
				//注册成功返回1
				return userMapper.updateUserPswByUserName(userName,psw);    
			}
		}
	}

	@Override
	public int resetUserPsw(String userName, String userPsw, String code) {
		String phoneCode = jedisClient.get(userName+":code");
		if(!(phoneCode.equals(code))){
			//验证码不正确
			return 0;
		}else{
			//重置密码
			//对密码进行md5编码
			String psw = DigestUtils.md5DigestAsHex(userPsw.getBytes());
			//注册成功返回1
			return userMapper.updateUserPswByUserName(userName,psw);    
		}
	}

	
	@Override
	public int updatePswByUserName(User user, String oldUserPsw, String newUserPsw) {
		//判断旧密码是否正确
		if(DigestUtils.md5DigestAsHex(oldUserPsw.getBytes()).equals(user.getUserPsw())){
			//正确
			String pass = DigestUtils.md5DigestAsHex(newUserPsw.getBytes());
			return userMapper.updateUserPswByUserName(user.getUserName(), pass);
		}else {
			//错误
			return 0;
		}
	}
		
	@Override
	public int insert(User user) throws Exception {
		int i = userMapper.insert(user);// TODO Auto-generated method stub
	return i;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		int deleteList = userMapper.deleteList(pks);
		return deleteList;
	}
}
