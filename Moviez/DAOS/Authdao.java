package in.react.tktbooking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Authdao {
    private static final String url = "jdbc:mysql://localhost:3306/tkt_booking";
    private static final String user = "root";
    private static final String password = "root";
    
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
    
    public static int insertSignup(Signupdto dto) throws Exception {
        if (EmailExists(dto.getEmail())) {
            throw new Exception("Email already exists");
        }
        String query = "INSERT INTO signup(email, first_name, last_name, mobile, password) VALUES(?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, dto.getEmail());
            ps.setString(2, dto.getFirst_name());
            ps.setString(3, dto.getLast_name());
            ps.setString(4, dto.getMobile());
            ps.setString(5, dto.getPassword()); 
            int rows = ps.executeUpdate();
            
            if (rows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);  
                    }
                }
            }
            return 0;
        }
    }
    
    private static boolean EmailExists(String email) throws Exception {
        String query = "SELECT COUNT(*) FROM signup WHERE email = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
    
    public static int loginUser(Signindto dto) throws Exception {
        String query = "SELECT sid, password FROM signup WHERE email = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, dto.getEmail());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedPassword = rs.getString("password");  
                    if (storedPassword.equals(dto.getPassword())) {  
                        return rs.getInt("sid");
                    }
                }
            }
        }
        throw new Exception("Invalid email or password");
    }
    
    public static Signupdto getUserBySid(int sid) throws Exception {
        String query = "SELECT email, first_name, last_name, mobile FROM signup WHERE sid = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, sid);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Signupdto dto = new Signupdto();
                    dto.setSid(sid);
                    dto.setEmail(rs.getString("email"));
                    dto.setFirst_name(rs.getString("first_name"));
                    dto.setLast_name(rs.getString("last_name"));
                    dto.setMobile(rs.getString("mobile"));
                    return dto;
                }
            }
        }
        return null;  
    }
}
