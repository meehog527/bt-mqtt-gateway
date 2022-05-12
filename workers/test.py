from mqtt import MqttMessage
from workers.base import BaseWorker

REQUIREMENTS = ['pip_packages']

class TimeWorker(BaseWorker):
  def _setup(self):
    self._some = 'variable'

  def status_update(self):
    from datetime import datetime
    
    return [MqttMessage(topic=self.format_topic('time'), payload=datetime.now())]
