package View.Components;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.StackPane;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class ButtonWithImage extends StackPane implements Initializable {

    @FXML
    private Label buttonText;

    @FXML
    private ImageView buttonImage;

    public ButtonWithImage() {
        super();
        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/Components" +
                    "/ButtonWithImage.fxml"));
            //fxmlLoader.setRoot(this);
            fxmlLoader.setController(this);
            Node n = fxmlLoader.load();
            this.getChildren().add(n);
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }

    public void setImage(String imagePath) {
        buttonImage.setImage(new Image(imagePath));
    }

    public void setText(String text) {
        buttonText.setText(text);
    }

}
