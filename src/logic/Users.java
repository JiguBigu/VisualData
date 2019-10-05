package logic;



/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 * @function 用户登录类
 */
public class Users {
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码
     */
    private String password;

    /**
     * 设置用户名
     * @param username 用户名
     */
    public void setUsername(String username){
        this.username = username;
    }

    /**
     * 获取用户名
     * @return 用户名
     */
    public String getUsername(){
        return this.username;
    }

    /**
     * 设置密码
     * @param password 密码
     */
    public void setPassword(String password){
        this.password = password;
    }

    /**
     * 获取密码
     * @return 密码
     */
    public String getPassword(){
        return this.password;
    }

    /**
     * 构造方法
     */
    public Users(){}
}
