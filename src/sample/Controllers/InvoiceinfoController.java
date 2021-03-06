package sample.Controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import sample.Database.DBConnection;
import sample.entity.InvoiceDetails;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class InvoiceinfoController implements Initializable {

    public Button exitButton;
    Connection con;
    public TableView invoiceTableView;
    public TableColumn numberColumn;
    public TableColumn nameproductColumn;
    public TableColumn priceColumn;
    public TableColumn quantityColumn;
    public TableColumn totalproductColumn;

    public Label idinvoiceLabel;
    public Label daycreLabel;
    public Label totalLabel;
    public Label codememLabel;
    public Label discountLabel;
    public Label namememLabel;
    public Label paidamountLabel;

    int j = 0;
    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        con = DBConnection.DBConn();
        showInvoiceDetails();
        totalLabel.setText(String.valueOf(j));
    }

    public void showInvoiceDetails() {
        ObservableList<InvoiceDetails> list = getInvoiceDetails();

        numberColumn.setCellValueFactory(new PropertyValueFactory<>("number"));
        nameproductColumn.setCellValueFactory(new PropertyValueFactory<>("nameProduct"));
        priceColumn.setCellValueFactory(new PropertyValueFactory<>("price"));
        quantityColumn.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        totalproductColumn.setCellValueFactory(new PropertyValueFactory<>("totalprice"));

        invoiceTableView.setItems(list);
    }

    private ObservableList<InvoiceDetails> getInvoiceDetails() {
        ObservableList<InvoiceDetails> list = FXCollections.observableArrayList();
        try {
            InvoiceDetails invoiceDetails;
            int i = 1;
            ResultSet resultSet = con.createStatement().executeQuery("SELECT * FROM tblInvoiceDetail");
            while (resultSet.next()) {
                invoiceDetails = new InvoiceDetails(i, getNamebyIdproduct(resultSet.getInt("id_product")), resultSet.getInt("price"), resultSet.getInt("quantity"), resultSet.getInt("totalprice"));
                i++;
                list.add(invoiceDetails);
                j+= resultSet.getInt("totalprice");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getNamebyIdproduct(int id) throws SQLException {
        String name = null;
        PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM tblProduct WHERE id_product = ?");
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            name= resultSet.getString("name_product");
        }
        return name;
    }


    public void ExitOnAction(ActionEvent actionEvent) {
        try {
            openInvoice();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void openInvoice() throws IOException {
        Parent root = FXMLLoader.load(getClass().getResource("../FXML/frmInvoice.fxml"));
        Scene fxmlFile = new Scene(root);
        Stage window = (Stage) exitButton.getScene().getWindow();
        window.setScene(fxmlFile);
        window.setTitle("DEMO 6");
        window.show();
    }
}
