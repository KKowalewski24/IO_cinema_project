package View.MainMenu;

import Controller.LPermissionController;
import Tools.PermissionChecker;
import View.Components.ButtonWithImage;
import View.Components.NumericKeyboard;
import View.Program;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ButtonType;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import lombok.Getter;
import lombok.Setter;

import java.io.IOException;

public class Login {
    @FXML
    private PasswordField passwordField;
    @FXML
    private TextField logInTextField;

    @Getter
    @Setter
    private Stage stage;

    @FXML
    private ButtonWithImage btnClose;

    @FXML
    private NumericKeyboard keyboard;

    public void logIn() throws IOException {
        System.out.println(passwordField.getText());
        System.out.println(logInTextField.getText());
        try {
            LPermissionController.getInstance().checkFailCounter();
            LPermissionController.getInstance().login(logInTextField.getText(),
                    passwordField.getText());
            showMainMenu();
        } catch (Exception e) {
            Alert alert = new Alert(AlertType.WARNING, "", ButtonType.YES);
            alert.setHeaderText(e.getMessage());
            alert.setContentText("Attempt " + LPermissionController.getInstance().getFailCounter() + "out of 5");
            alert.showAndWait();
        }
    }

    public void showMainMenu() throws IOException {

        Parent fxmlLoader = FXMLLoader.load(getClass().getResource("/MainMenu/MainMenu.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(fxmlLoader, Program.screenBounds.getWidth(), Program.screenBounds
                .getHeight());
        Program.getPrimaryStage().setScene(scene);

    }

    public void printPermission() throws IOException {
        PermissionChecker pc = new PermissionChecker();
        System.out.println(pc.getPermissionsList());

    }

    public void onConfirm(MouseEvent actionEvent) {
        System.out.println("Confirm");

        try {
            LPermissionController.getInstance().checkFailCounter();
            LPermissionController.getInstance().login(keyboard.getCodeField().getText());
            showMainMenu();
        } catch (Error | Exception e) {
            Alert alert = new Alert(AlertType.WARNING, "", ButtonType.YES);
            alert.setHeaderText(e.getMessage());
            alert.showAndWait();
        }
    }

    public void checkFailCounter() throws Exception {
        if (LPermissionController.getInstance().getFailCounter() >= 4) {
            throw new Exception("Limit of 5 login attempts exceeded");
        }
    }

    public void btnCancel_Click(ActionEvent actionEvent) {
        System.out.println("Cancel");
//        codeField.setText("");
    }

    public void exit(MouseEvent mouseEvent) {
        System.exit(0);
    }
}
