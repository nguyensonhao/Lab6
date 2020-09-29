package Object;


public class User {

    private String Username;
    private String Password;
    private String FName;
    private String LName;
    private int isSend;
    private String Website;
    private int roleId;
    private String Email;

    public User(String Username, String Password, String FName, String LName, int isSend, String Website, int roleId, String Email) {
        this.Username = Username;
        this.Password = Password;
        this.FName = FName;
        this.LName = LName;
        this.isSend = isSend;
        this.Website = Website;
        this.roleId = roleId;
        this.Email = Email;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getFName() {
        return FName;
    }

    public void setFName(String FName) {
        this.FName = FName;
    }

    public String getLName() {
        return LName;
    }

    public void setLName(String LName) {
        this.LName = LName;
    }

    public int getIsSend() {
        return isSend;
    }

    public void setIsSend(int isSend) {
        this.isSend = isSend;
    }

    public String getWebsite() {
        return Website;
    }

    public void setWebsit(String Website) {
        this.Website = Website;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
}
