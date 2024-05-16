from mlopt.learners.pytorch.pytorch import PytorchNeuralNet
from mlopt.learners.optimal_tree.optimal_tree import OptimalTree
from mlopt.learners.xgboost.xgboost import XGBoost
from mlopt.learners.oct.oct import optimalDecisionTreeClassifier
import mlopt.settings as s

LEARNER_MAP = {s.PYTORCH: PytorchNeuralNet,
               s.OPTIMAL_TREE: OptimalTree,
               s.XGBOOST: XGBoost,
               s.OCT: optimalDecisionTreeClassifier,}


def installed_learners():
    """List the installed learners.
    """
    installed = []

    for name, learner in LEARNER_MAP.items():
        if learner.is_installed():
            installed.append(name)

    return installed
