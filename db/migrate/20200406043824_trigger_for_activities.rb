class TriggerForActivities < ActiveRecord::Migration[6.0]
  def up
    execute "
      CREATE TRIGGER order_trigger AFTER INSERT ON orders
      FOR EACH ROW
      BEGIN
        INSERT INTO activities (order_id, text, created_at, updated_at)
        VALUES(NEW.id, concat( (SELECT name from users where id = NEW.user_id), ' created order' ), NOW(), NOW());
      END
    "

    execute "
      CREATE TRIGGER order_trigger_update AFTER UPDATE ON orders
      FOR EACH ROW
      BEGIN
        INSERT INTO activities (order_id, text, created_at, updated_at)
        VALUES(NEW.id, concat( (SELECT name from users where id = NEW.user_id), ' changed order status to: ', (SELECT ELT(NEW.status+1, 'waiting', 'finished', 'cancelled')) ), NOW(), NOW());
      END
    "
  end
  def down
    execute "DROP TRIGGER if exists order_trigger;"
    execute "DROP TRIGGER if exists order_trigger_update;"
  end
end
