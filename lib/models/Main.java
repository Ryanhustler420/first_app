public interface InnerMain {
    void attack(int a);
    void help();
}

public class Main implements InnerMain {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }

    @Override
    public void attack(int a) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void help() {
        // TODO Auto-generated method stub
        
    }
}