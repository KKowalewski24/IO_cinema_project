package View.Sale;

import DBO.PackDAO;
import DBO.ProductDAO;
import DBO.SaleDAO;
import Model.Pack;
import Model.Sale;
import Model.SalePO;
import Tools.PermissionChecker;
import View.Sale.Simple.SimplePack;
import View.Sale.Simple.SimplePackPO;
import View.Sale.Simple.SimpleSale;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import javafx.util.Pair;
import lombok.Getter;
import lombok.Setter;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static javafx.collections.FXCollections.observableArrayList;

public class SaleCashbox {

    @Getter
    @Setter
    private Scene scene;

    @FXML
    private TableView<SimplePack> tableOfPack = new TableView<>();

    @FXML
    private TableView<SimplePackPO> tableOfPackContent = new TableView<>();

    @FXML
    private TableView<SimpleSale> tableOfOrderContent = new TableView<>();

    @FXML
    private javafx.scene.control.Label priceOfOrder = new Label();

    private ObservableList<SimplePack> packs;
    private ObservableList<SimplePackPO> packContentList = observableArrayList();
    private ObservableList<SimpleSale> orderContent = observableArrayList();

    List<Pair<Long, Integer>> amountOfProductsInOrder = new ArrayList<>();

    Stage primaryStage;

    public SaleCashbox(Stage primary) throws IOException {

        primaryStage = primary;
        var fxmlLoader = new FXMLLoader(getClass().getResource("/Sale/SaleCashbox.fxml"));
        fxmlLoader.setController(this);
        Pane pane = fxmlLoader.load();
        scene = new Scene(pane);

        packs = SimplePack.getListOfPacks();

        tableOfPack.setItems(packs);
        tableOfOrderContent.setItems(orderContent);
        tableOfPackContent.setItems(packContentList);
    }

    public void showPackContent() {
        int index = tableOfPack.getSelectionModel().selectedIndexProperty().get();
        packContentList.clear();
        packContentList = SimplePackPO.getContentOfPack((int) packs.get(index).getId());

        tableOfPackContent.setItems(packContentList);
        tableOfPackContent.refresh();
    }

    public void goBack() throws IOException {
        primaryStage.setScene(new SaleMenu(primaryStage).getScene());
        primaryStage.show();
    }

    public void addPackToOrder() {
        int selectedPack = tableOfPack.getSelectionModel().selectedIndexProperty().get();
        SimplePack simplePack = packs.get(selectedPack);

        boolean alreadyInPack = false;

        for (int i = 0; i < orderContent.size(); i++) {
            if (orderContent.get(i).getPackHId() == simplePack.getId()) {

                Alert alert = new Alert(Alert.AlertType.ERROR,
                        "This product is already in this Pack. Please, change amount instead of " +
                                "adding!",
                        ButtonType.OK);
                alert.showAndWait();
                alreadyInPack = true;
                break;
            }
        }

        if (!alreadyInPack) {
            TextInputDialog d1 = new TextInputDialog();
            d1.setTitle("How many packs do you wanna add?");
            d1.setContentText("Enter amount");
            Optional<String> result = d1.showAndWait();

            if (result.isPresent()) {
                String amount = result.get();
                int keyIndex = 0;
                boolean enoughInMagazine = true;
                boolean keyExists;
                List<Pair<Long, Integer>> amountOfProductsInPack = new ArrayList<>();
                List<Integer> checkerI = new ArrayList<>();
                List<Integer> checkerAmount = new ArrayList<>();
                List<Integer> checkerKey = new ArrayList<>();

                for (int i = 0; i < packContentList.size(); i++) {
                    keyExists = false;
                    amountOfProductsInPack.add(new Pair<>(
                            packContentList.get(i).getProductId(),
                            packContentList.get(i).getAmount())
                    );

                    for (int j = 0; j < amountOfProductsInOrder.size(); j++) {
                        if (amountOfProductsInOrder.get(j).getKey() == packContentList.get(i).getId()) {
                            keyIndex = j;
                            keyExists = true;
                            break;
                        }
                    }
                    int newAmountInOrder;

                    if (!keyExists) {
                        newAmountInOrder =
                                packContentList.get(i).getAmount() * Integer.valueOf(amount);
                        if (newAmountInOrder <= ((Integer) ProductDAO.getAmountById(packContentList.get(i).getProductId()).get(0))) {
                            checkerI.add(i);
                            checkerAmount.add(newAmountInOrder);
                            checkerKey.add(-1);
                        } else {
                            Alert alert = new Alert(Alert.AlertType.ERROR,
                                    "There is not enough " + simplePack.getName() + " in magazine" +
                                            "!", ButtonType.CLOSE);
                            alert.showAndWait();
                            enoughInMagazine = false;
                            break;
                        }
                    } else {
                        newAmountInOrder =
                                amountOfProductsInOrder.get(keyIndex).getValue() + (Integer.valueOf(amount) * packContentList.get(i).getAmount());
                        if (newAmountInOrder <= ((Integer) ProductDAO.getAmountById(packContentList.get(i).getProductId()).get(0))) {
                            checkerI.add(i);
                            checkerAmount.add(newAmountInOrder);
                            checkerKey.add(keyIndex);
                        } else {
                            Alert alert = new Alert(Alert.AlertType.ERROR,
                                    "There is not enough " + simplePack.getName() + " in magazine" +
                                            "!", ButtonType.CLOSE);
                            alert.showAndWait();
                            enoughInMagazine = false;
                            break;
                        }
                    }
                }
                if (enoughInMagazine) {
                    Alert alert = new Alert(Alert.AlertType.INFORMATION, "SUCEEDED",
                            ButtonType.CLOSE);
                    alert.showAndWait();

                    orderContent.add(
                            new SimpleSale(
                                    simplePack.getName(),
                                    Integer.valueOf(amount),
                                    simplePack.price.multiply(Integer.valueOf(amount)).doubleValue(),
                                    amountOfProductsInPack,
                                    simplePack.getId()
                            )
                    );
                    for (int i = 0; i < checkerI.size(); i++) {
                        if (checkerKey.get(i) != -1) {
                            amountOfProductsInOrder.set(checkerKey.get(checkerI.get(i)),
                                    new Pair<>(amountOfProductsInOrder.get(checkerKey.get(checkerI.get(i))).getKey(),
                                            checkerAmount.get(checkerI.get(i))));
                        } else {
                            amountOfProductsInOrder.add(new Pair<>(packContentList.get(checkerI.get(i)).getProductId(),
                                    checkerAmount.get(checkerI.get(i))));
                        }
                    }

                    tableOfOrderContent.setItems(orderContent);
                    tableOfOrderContent.refresh();
                    calculatePrice();
                }
            }
        }
    }

    public void removePackFromOrder() {
        int selectedPack = tableOfOrderContent.getSelectionModel().selectedIndexProperty().get();
        SimpleSale simpleSale = orderContent.get(selectedPack);

        for (int i = 0; i < simpleSale.productInSale.size(); i++) {
            for (int j = 0; j < amountOfProductsInOrder.size(); j++) {
                if (amountOfProductsInOrder.get(j).getKey().equals(simpleSale.productInSale.get(i).getKey())) {
                    int newAmount = (int)
                            (amountOfProductsInOrder.get(j).getValue() -
                                    (simpleSale.productInSale.get(i).getValue() *
                                            simpleSale.getAmount()));

                    if (newAmount == 0) {
                        amountOfProductsInOrder.remove(j);
                    } else {
                        amountOfProductsInOrder.set(j,
                                new Pair<>(amountOfProductsInOrder.get(j).getKey(), newAmount));
                    }
                }
            }
        }
        orderContent.remove(selectedPack);
        tableOfOrderContent.refresh();
        calculatePrice();
    }

    private double calculatePrice() {
        double price = 0;
        for (SimpleSale simpleSale : orderContent) {
            price += simpleSale.getPrice();
        }
        priceOfOrder.setText("Price: " + price);
        return price;
    }

    public void confirmOrder() throws IOException {

        PermissionChecker pc = new PermissionChecker();
        Sale order = new Sale(
                pc.getCurrentUser().getId(),
                new Timestamp(System.currentTimeMillis()),
                new BigDecimal(calculatePrice())
        );

        for (int i = 0; i < orderContent.size(); i++) {
            order.add(new SalePO((Pack) PackDAO.getAllByID(orderContent.get(i).getPackHId()).get(0), new BigDecimal(orderContent.get(i).getAmount())));
        }
        SaleDAO.insert(order);

        for (int i = 0; i < amountOfProductsInOrder.size(); i++) {
            ProductDAO.updateAmount(amountOfProductsInOrder.get(i).getKey(),
                    amountOfProductsInOrder.get(i).getValue());
        }

        Alert alert = new Alert(Alert.AlertType.CONFIRMATION,
                "Your order has been made. We'd print you a receipt but we really don't want to." +
                        " Do you want to make new order?",
                ButtonType.YES, ButtonType.NO);
        alert.showAndWait();

        if (alert.getResult() == ButtonType.YES) {
            orderContent.clear();
            tableOfOrderContent.refresh();
            amountOfProductsInOrder.clear();
        } else {
            goBack();
        }

    }

    public void cancelOrder() throws IOException {
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION, "Do you want to cancel making this " +
                "order?", ButtonType.YES, ButtonType.NO);
        alert.showAndWait();

        if (alert.getResult() == ButtonType.YES) {
            goBack();
        }
    }

}
