package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Manager;
import entity.Member;

public class MemberDao {
	DBconn conn = new DBconn();
	Member member;
	
	/**管理员根据用户ID删除用户
	 * @param id
	 * @return true;
	 */
	public boolean del(int id){
		return conn.update("delete from member where memberid=?", new String[]{String.valueOf(id)})>0;
	}
	/**管理员根据用户ID更改用户状态
	 * @param membername
	 * @param memberid
	 * @return >0更改成功，<=0更改失败
	 */
	public int updateStatus(String memberStatus,String memberid){
		return conn.update("update member set memberStatus=? where memberid=?",new String[]{memberStatus,memberid});
	}
	public ArrayList<Member> queryAll(){
			ArrayList<Member> list = new ArrayList<Member>();
			ResultSet rs=conn.query("select * from Member", null);
			try {
				while(rs.next()){
					Member type=new Member(rs.getInt("memberid"),rs.getString("memberemail"), null, null, null, null,rs.getString("membername"), null, null, rs.getString("Address"), rs.getString("jointime"),rs.getString("MemberStatus"));
					list.add(type);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				conn.closeAll();
			}
			return list;
	}
	
	//用户申请
	
	/** 用户注册将注册信息添加进入数据库
	 * @param email
	 * @param loginPwd
	 * @return
	 */
	public Member queryMemberEmail(String email){
		Member member=null;
		ResultSet rs=conn.query("select * from member where memberEmail=?", new String[]{email});
		try {
			while(rs.next()){
				member=new Member();
				member.setMemberEmail(rs.getString("MEMBEREMAIL"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return member;
	}
	
	public boolean add(Member member){
		return conn.update("insert into member(memberemail,memberpwd,jointime) values(?,?,sysdate)", new String[]{member.getMemberEmail(),member.getMemberPwd()})>0;
	}
	//用于修改用自己修改户资料
	/**用户
	
	 * @param NickName 昵称
	 * @param pwdQuestion 密报问题
	 * @param pwdAnswer 密报答案	
	 * @param sex  性别
	 * @param phone 电话
	 * @param address 地址 
	 * @param memberId 用户ID
	 * @return
	 */
	public boolean update(Member member){
		return conn.update("update member set nickname=?,pwdQuestion=?,pwdAnswer=?,gender=?,phone=?,address=? where memberid=?", new String[]{member.getNickName(),
				 member.getPwdQuestion(),member.getPwdAnswer(),
				 member.getGender(),member.getPhone(),member.getAddress(),String.valueOf(member.getMemberId())})>0;
	}
	/** 用户进行密码修改
	 * @param pwd
	 * @return
	 */
	public boolean updatePwd(String pwd,int uid){
		return conn.update("update member set memberpwd=? where memberid=?",new String[]{pwd,String.valueOf(uid)})>0;
		
	}
	
	
	/** 用户在会员中心修改密码
	 * @param pwd
	 * @return
	 */
	public boolean modifyPwd(String oldPwd,String id,String newPwd){
		return conn.update("update member set memberpwd=? where memberid=? and memberpwd=?",new String[]{newPwd,id,oldPwd})>0;
		
	}
	/** 查找所有已被禁用的用户的数量
	 * 
	 */
	public int getDisableCount(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from member where MEMBERSTATUS='已禁用'",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	/** 查找所有已被禁用的用户的数量
	 * 
	 */
	public int getEnableCount(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from member where MEMBERSTATUS='已启用'",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	
	
	/** 用户进行邮箱修改
	 * @param pwd
	 * @return
	 */
	public boolean updateEmail(String oldEmail,String newEmail){
		return conn.update("update member set memberemail=? where memberemail=?",new String[]{newEmail,oldEmail})>0;
		
	}
	
	/**
	 * 得到已注册会员的数量
	 * @return
	 */
	public int getCount(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from member",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	
	
	/**
	 * @param page页数
	 * @param size显示记录数
	 * @return根据分页获取数据记录
	 */
	public ArrayList<Member> queryByPage(int page,int size) {
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rs = conn.query("select * from (select rownum as id,m.* from member m order by memberid ) where id between ? and ?",new String[]{String.valueOf((size*(page-1))+1),String.valueOf(size*page)});

		try {
			while(rs.next()){
				Member m = new Member();
				m.setMemberId(rs.getInt("MEMBERID"));
				m.setMemberEmail(rs.getString("MEMBEREMAIL"));
				m.setNickName(rs.getString("NICKNAME"));
				m.setMemberPwd(rs.getString("MEMBERPWD"));
				m.setPwdQuestion(rs.getString("PWDQUESTION"));
				m.setPwdAnswer(rs.getString("PWDANSWER"));
				m.setMemberName(rs.getString("MEMBERNAME"));
				m.setGender(rs.getString("GENDER"));
				m.setPhone(rs.getString("PHONE"));
				m.setAddress(rs.getString("ADDRESS"));
				m.setJoNumberime(rs.getString("JOINTIME"));
				m.setMemberStatus(rs.getString("MEMBERSTATUS"));
				list.add(m);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	

	/**
	 * @param page页数
	 * @param size显示记录数
	 * @return根据分页获取已被禁用用户数据
	 */
	public ArrayList<Member> queryDisableByPage(int page,int size) {
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rs = conn.query("select * from (select rownum as id,m.* from member m where MEMBERSTATUS='已禁用' order by memberid ) where id between ? and ?",new String[]{String.valueOf((size*(page-1))+1),String.valueOf(size*page)});
		try {
			while(rs.next()){
				Member m = new Member();
				m.setMemberId(rs.getInt("MEMBERID"));
				m.setMemberEmail(rs.getString("MEMBEREMAIL"));
				m.setNickName(rs.getString("NICKNAME"));
				m.setMemberPwd(rs.getString("MEMBERPWD"));
				m.setPwdQuestion(rs.getString("PWDQUESTION"));
				m.setPwdAnswer(rs.getString("PWDANSWER"));
				m.setMemberName(rs.getString("MEMBERNAME"));
				m.setGender(rs.getString("GENDER"));
				m.setPhone(rs.getString("PHONE"));
				m.setAddress(rs.getString("ADDRESS"));
				m.setJoNumberime(rs.getString("JOINTIME"));
				m.setMemberStatus(rs.getString("MEMBERSTATUS"));
				list.add(m);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	
	

	/**
	 * @param page页数
	 * @param size显示记录数
	 * @return根据分页获取已被启用用户数据
	 */
	public ArrayList<Member> queryEnableByPage(int page,int size) {
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rs = conn.query("select * from (select rownum as id,m.* from member m where MEMBERSTATUS='已启用' order by memberid ) where id between ? and ?",new String[]{String.valueOf((size*(page-1))+1),String.valueOf(size*page)});
		try {
			while(rs.next()){
				Member m = new Member();
				m.setMemberId(rs.getInt("MEMBERID"));
				m.setMemberEmail(rs.getString("MEMBEREMAIL"));
				m.setNickName(rs.getString("NICKNAME"));
				m.setMemberPwd(rs.getString("MEMBERPWD"));
				m.setPwdQuestion(rs.getString("PWDQUESTION"));
				m.setPwdAnswer(rs.getString("PWDANSWER"));
				m.setMemberName(rs.getString("MEMBERNAME"));
				m.setGender(rs.getString("GENDER"));
				m.setPhone(rs.getString("PHONE"));
				m.setAddress(rs.getString("ADDRESS"));
				m.setJoNumberime(rs.getString("JOINTIME"));
				m.setMemberStatus(rs.getString("MEMBERSTATUS"));
				list.add(m);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	
	
	/**
	 * @param email登录邮箱
	 * @param pwd登录密码
	 * @return根据登录邮箱跟登录密码获取数据
	 */
	public Member login(String email,String pwd){
		Member member=null;
		ResultSet rs=conn.query("select * from member where memberEmail=? and memberPwd=?", new String[]{email,pwd});
		try {	
	
			while(rs.next()){
				member=new Member();
				member.setMemberId(rs.getInt("MEMBERID"));
				member.setMemberEmail(rs.getString("MEMBEREMAIL"));
				member.setNickName(rs.getString("NICKNAME"));
				member.setMemberPwd(rs.getString("MEMBERPWD"));
				member.setPwdQuestion(rs.getString("PWDQUESTION"));
				member.setPwdAnswer(rs.getString("PWDANSWER"));
				member.setMemberName(rs.getString("MEMBERNAME"));
				member.setGender(rs.getString("GENDER"));
				member.setPhone(rs.getString("PHONE"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setJoNumberime(rs.getString("JOINTIME"));
				member.setMemberStatus(rs.getString("MEMBERSTATUS"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return member;
	}
	
	/**
	 * @param memberId会员id
	 * @return返回会员对象
	 */
	public Member queryByMemberId(String memberId){
		Member member=null;
		ResultSet rs=conn.query("select * from member where memberId=?", new String[]{memberId});
		try {
			while(rs.next()){
				member=new Member();
				member.setMemberId(rs.getInt("MEMBERID"));
				member.setMemberEmail(rs.getString("MEMBEREMAIL"));
				member.setNickName(rs.getString("NICKNAME"));
				member.setMemberName(rs.getString("MEMBERNAME"));
				member.setGender(rs.getString("GENDER"));
				member.setPhone(rs.getString("PHONE"));
				member.setAddress(rs.getString("ADDRESS"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return member;
	}
	
	
	/*
	 * 用于会员中心修改资料
	 */
	public boolean updataInfomationById(String id, Member member2) {
		// TODO Auto-generated method stub

		return conn.update("update member set GENDER=?,NICKNAME=?,PHONE=?,ADDRESS=? where MEMBERID=?",new String[]{member2.getGender(),member2.getNickName(),member2.getPhone(),member2.getAddress(),id})>0;
		
	}
}
