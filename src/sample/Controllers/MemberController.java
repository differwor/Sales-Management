package sample.Controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import sample.Database.DBConnection;
import sample.entity.Member;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class MemberController implements Initializable {
    public TableView<Member> memberTableView;
    public TableColumn<Member, Integer> idColumn;
    public TableColumn<Member, Integer> codeColumn;
    public TableColumn<Member, String> memberColumn;
    public TextField memberTextField;
    public Button saveButton;
    public Button deleteButton;
    public Button updateButton;
    public TextField codeTextField;

    Connection con = null;


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        con = DBConnection.DBConn();
        showMember();
        addListenerForTable();
    }

    public void SaveOnAction(ActionEvent actionEvent) {
        insertRecord();
    }

    public void DeleteOnAction(ActionEvent actionEvent) {
        Member member = memberTableView.getSelectionModel().getSelectedItem();
        String query = " DELETE FROM tblMember WHERE id = '" + member.getId() + "' ";
        executeQuery(query);
        showMember();
    }

    public void UpdateOnAction(ActionEvent actionEvent) {
        Member member = memberTableView.getSelectionModel().getSelectedItem();
        String query = " UPDATE tblMember SET code_member = '" + codeTextField.getText() + "', name_member = '" + memberTextField.getText() + "' WHERE id = '" + member.getId()+ "' ";
        executeQuery(query);
        showMember();
    }

    public void showMember() {
        ObservableList<Member> list = getMemberList();
        idColumn.setCellValueFactory(new PropertyValueFactory<Member, Integer>("Id"));
        codeColumn.setCellValueFactory(new PropertyValueFactory<Member, Integer>("Code"));
        memberColumn.setCellValueFactory(new PropertyValueFactory<Member, String>("Name"));
        memberTableView.setItems(list);
    }

    private ObservableList<Member> getMemberList() {
        ObservableList<Member> memberList = FXCollections.observableArrayList();
        String query = "SELECT * FROM tblMember";
        Statement st;
        ResultSet rs;

        try {
            st = con.createStatement();
            rs = st.executeQuery(query);
            Member member;
            while(rs.next()) {
                member = new Member(rs.getInt("id"), rs.getInt("code_member"), rs.getString("name_member"));
                memberList.add(member);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return memberList;
    }

    public void addListenerForTable() {
        memberTableView.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
            if (newSelection != null) {
                updateButton.setDisable(false);
                deleteButton.setDisable(false);
                codeTextField.setText(String.valueOf(newSelection.getCode()));
                memberTextField.setText(newSelection.getName());
            } else {
                codeTextField.setText("");
                memberTextField.setText("");
                updateButton.setDisable(true);
                deleteButton.setDisable(true);
            }
        });
    }

    public void insertRecord() {
        String codemember = codeTextField.getText();
        String membername = memberTextField.getText();
        if (!codemember.isEmpty() && !membername.isEmpty()) {
            String query = "INSERT INTO tblMember (code_member, name_member) VALUES ('" + Integer.valueOf(codemember) + "', '" + membername + "')";
            executeQuery(query);
            showMember();
            codeTextField.setText("");
            memberTextField.setText("");
        }
    }

    public void executeQuery(String query) {
        Statement st;
        System.out.println(query);
        try {
            st = con.createStatement();
            st.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}