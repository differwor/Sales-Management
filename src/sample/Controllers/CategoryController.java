package sample.Controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Window;
import sample.Database.DBConnection;
import sample.entity.Category;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;

public class CategoryController implements Initializable {

    Window owner;
    Connection con = null;

    public TableView<Category> categoryTableView;
    public TableColumn<Category, Integer> idColumn;
    public TableColumn<Category, String> nameColumn;
    public TextField categoryTextField;
    public Button saveButton;
    public Button deleteButton;
    public Button updateButton;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        con = DBConnection.DBConn();
        showCategory();
        addListenerForTable();
    }

    public void SaveOnAction(ActionEvent actionEvent) {
        insertRecord();
    }

    public void DeleteOnAction(ActionEvent actionEvent) {
        Category category = categoryTableView.getSelectionModel().getSelectedItem();
        String query = " DELETE FROM tblCategory WHERE id_category = '" + category.getId() + "' ";
        executeQuery(query);
        showCategory();
    }

    public void UpdateOnAction(ActionEvent actionEvent) {
        Category category = categoryTableView.getSelectionModel().getSelectedItem();
        String query = " UPDATE tblCategory SET name_category = '" + categoryTextField.getText() + "' WHERE id_category = '" + category.getId() + "' ";
        executeQuery(query);
        showCategory();
    }

    public void showCategory() {
        ObservableList<Category> list = getCategoryList();
        idColumn.setCellValueFactory(new PropertyValueFactory<Category, Integer>("Id"));
        nameColumn.setCellValueFactory(new PropertyValueFactory<Category, String>("Namecategory"));
        categoryTableView.setItems(list);
    }

    private ObservableList<Category> getCategoryList() {
        ObservableList<Category> categoryList = FXCollections.observableArrayList();
        String query = "SELECT * FROM tblCategory";
        Statement st;
        ResultSet rs;

        try {
            st = con.createStatement();
            rs = st.executeQuery(query);
            Category category;
            while(rs.next()) {
                category = new Category(rs.getInt("id_category"), rs.getString("name_category"));
                categoryList.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }

    public void addListenerForTable() {
        categoryTableView.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
            if (newSelection != null) {
                updateButton.setDisable(false);
                deleteButton.setDisable(false);
                categoryTextField.setText(newSelection.getNamecategory());
            } else {
                categoryTextField.setText("");
                updateButton.setDisable(true);
                deleteButton.setDisable(true);
            }
        });
    }

    public void insertRecord() {
        String namecategory = categoryTextField.getText();
        if (!namecategory.isEmpty()) {
            executeQuery("INSERT INTO tblCategory (name_category) VALUES ('" + namecategory + "')");
            showCategory();
            categoryTextField.setText("");
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