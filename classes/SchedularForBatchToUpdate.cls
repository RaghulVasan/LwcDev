public with sharing class SchedularForBatchToUpdate implements Schedulable {
    public SchedularForBatchToUpdate() {

    }
    public void execute(schedulableContext context)
    {
        Database.executeBatch(new GenerateRandomNumberAccountContact(),2);
    }
}