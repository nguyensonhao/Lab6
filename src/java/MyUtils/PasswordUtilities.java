package MyUtils;

import java.io.Serializable;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtilities implements Serializable{
    /**
     * Get change encrypt password 
     * @param password
     * @return
     * @throws NoSuchAlgorithmException 
     */
    public static String getEncryptPassword(String password) throws NoSuchAlgorithmException{
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return new BigInteger(1, md.digest(password.getBytes())).toString(16);
    }
}
